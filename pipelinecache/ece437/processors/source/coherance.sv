// interface include
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"
// memory types
`include "cpu_types_pkg.vh"

module coherance (
    input CLK, nRST,
    cache_control_if.cc ccif
);
    import cpu_types_pkg::*;

    typedef enum logic [4:0] {
        ARBITRATE,
        SNOOP,
        ACCESS1,
        ACCESS1_T,
        ACCESS2,
        ACCESS2_T,
        TRANSFER1,
        TRANSFER1_T,
        TRANSFER2,
        TRANSFER2_T,
        DWRITE1,
        DWRITE1_T,
        DWRITE2,
        DWRITE2_T,
        IREAD,
        IREAD_T
    }busState;

    busState state;
    busState nextState;

    logic cacheToCache;
    logic nextCacheToCache;
    logic requestor;
    logic nextRequestor;

    logic [1:0] nextccwait;
    logic [1:0] nextccinv;
    word_t [1:0] nextccsnoopaddr;
    
    word_t [1:0] next_dload;
    logic [1:0] next_dwait;
    word_t [1:0] next_iload;
    logic [1:0] next_iwait;

    always_ff @ (posedge CLK, negedge nRST) begin
        if (~nRST) begin
            state <= ARBITRATE;
            requestor <= 0;
            cacheToCache <= 0;

            ccif.ccwait <= '0;
            ccif.ccinv <= '0;
            ccif.ccsnoopaddr <= '0;

            ccif.dload <= '0;
            ccif.dwait <= '1;
            ccif.iload <= '0;
            ccif.iwait <= '1;
        end
        else begin
            state <= nextState;
            requestor <= nextRequestor;
            cacheToCache <= nextCacheToCache;

            ccif.ccwait <= nextccwait;
            ccif.ccinv <= nextccinv;
            ccif.ccsnoopaddr <= nextccsnoopaddr;

            ccif.dload <= next_dload;
            ccif.dwait <= next_dwait;
            ccif.iload <= next_iload;
            ccif.iwait <= next_iwait;
        end
    end

    always_comb begin
        //default temp values
        nextState = state;
        nextRequestor = requestor;
        nextCacheToCache = cacheToCache;

        //default cc values
        nextccinv = ccif.ccinv;
        nextccwait = ccif.ccwait;
        nextccsnoopaddr = ccif.ccsnoopaddr;

        //default cache and ram values
        //ccif.iwait = '1;
        //ccif.dwait = '1;
        //ccif.iload = '0;
        //ccif.dload = '0;
        ccif.ramstore = '0;
        ccif.ramaddr = '0;
        ccif.ramWEN = '0;
        ccif.ramREN = '0;

        next_dload = '0;
        next_dwait = '1;

        next_iload = '0;
        next_iwait = '1;

        casez(state)
        ARBITRATE: begin
            if (ccif.cctrans[0] && ccif.ccwrite[0]) begin
                nextState = SNOOP;
                nextccwait[1] = 1;
                nextccinv[1] = 1;
                nextccsnoopaddr[1] = ccif.daddr[0];
                nextRequestor = 0;
            end
            else if (ccif.cctrans[0]) begin
                nextState = SNOOP;
                nextccwait[1] = 1;
                nextccsnoopaddr[1] = ccif.daddr[0];
                nextRequestor = 0;
            end
            else if (ccif.cctrans[1] && ccif.ccwrite[1]) begin
                nextState = SNOOP;
                nextccwait[0] = 1;
                nextccinv[0] = 1;
                nextccsnoopaddr[0] = ccif.daddr[1];
                nextRequestor = 1;
            end
            else if (ccif.cctrans[1]) begin
                nextState = SNOOP;
                nextccwait[0] = 1;
                nextccsnoopaddr[0] = ccif.daddr[1];
                nextRequestor = 1;
            end
            else if (ccif.iREN[0] || ccif.iREN[1]) begin
                nextState = IREAD;
                if (ccif.iREN[0]) nextRequestor = 0;
                else nextRequestor = 1;
            end
            else if (ccif.dWEN[0] || ccif.dWEN[1]) begin
                nextState = DWRITE1;
                if (ccif.dWEN[0]) nextRequestor = 0;
                else nextRequestor = 1;
            end
        end
        IREAD: begin
            if (ccif.ramstate == ACCESS) begin
                if (~requestor) begin
                    next_iwait[0] = 0;
                    next_iload[0] = ccif.ramload;
                    nextState = IREAD_T;
                end
                else begin
                    next_iwait[1] = 0;
                    next_iload[1] = ccif.ramload;
                    nextState = IREAD_T;
                end
            end 
            
            ccif.ramREN = 1;
            if (~requestor) begin    
                ccif.ramaddr = ccif.iaddr[0];
            end
            else begin
                ccif.ramaddr = ccif.iaddr[1];
            end
        end
        IREAD_T: begin
            nextState = ARBITRATE;
        end
        DWRITE1: begin
            if (ccif.ramstate == ACCESS) begin
                if (~requestor) begin
                    nextState = DWRITE1_T;
                    next_dwait[0] = 0;
                end
                else begin
                    nextState = DWRITE1_T;
                    next_dwait[1] = 0;
                end
            end
            
            ccif.ramWEN = 1;
            if (~requestor) begin
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramstore = ccif.dstore[0];
            end
            else begin
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramstore = ccif.dstore[1];
            end
        end
        DWRITE1_T: begin
            nextState = DWRITE2;
        end
        DWRITE2: begin
            if (ccif.ramstate == ACCESS) begin
                if (~requestor) begin
                    nextState = DWRITE2_T;
                    next_dwait[0] = 0;
                end
                else begin
                    nextState = DWRITE2_T;
                    next_dwait[1] = 0;
                end
            end
            
            ccif.ramWEN = 1;
            if (~requestor) begin
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramstore = ccif.dstore[0];
            end
            else begin
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramstore = ccif.dstore[1];
            end
        end
        DWRITE2_T: begin
            nextState = ARBITRATE;
        end
        SNOOP: begin
            if (~requestor) begin
                if (ccif.cctrans[1] && ccif.ccwrite[1]) begin
                    nextState = TRANSFER1;
                    nextCacheToCache = 1;
                end
                else if (ccif.cctrans[1]) begin
                    nextState = ACCESS1;
                    nextCacheToCache = 0;
                end
            end
            else begin
                if (ccif.cctrans[0] && ccif.ccwrite[0]) begin
                    nextState = TRANSFER1;
                    nextCacheToCache = 1;
                end
                else if (ccif.cctrans[0]) begin
                    nextState = ACCESS1;
                    nextCacheToCache = 0;
                end
            end
        end
        ACCESS1: begin
            if (ccif.ramstate == ACCESS) begin
                if (~requestor) begin
                    nextState = ACCESS1_T;
                    next_dwait[0] = 0;
                    next_dload[0] = ccif.ramload;
                end
                else begin
                    nextState = ACCESS1_T;
                    next_dwait[1] = 0;
                    next_dload[1] = ccif.ramload;
                end
            end

            ccif.ramREN = 1;
            if (~requestor) begin
                ccif.ramaddr = ccif.daddr[0];
            end
            else begin
                ccif.ramaddr = ccif.daddr[1];
            end
        end
        ACCESS1_T: begin
            nextState = ACCESS2;
        end
        ACCESS2: begin
            if (ccif.ramstate == ACCESS) begin
                nextccinv = '0;
                nextccwait = '0;
                nextccsnoopaddr = '0;
                if (~requestor) begin
                    nextState = ACCESS2_T;
                    next_dwait[0] = 0;
                    next_dload[0] = ccif.ramload;
                end
                else begin
                    nextState = ACCESS2_T;
                    next_dwait[1] = 0;
                    next_dload[1] = ccif.ramload;
                end
            end
            
            ccif.ramREN = 1;
            if (~requestor) begin
                ccif.ramaddr = ccif.daddr[0];
            end
            else begin
                ccif.ramaddr = ccif.daddr[1];
            end
        end
        ACCESS2_T: begin
            nextState = ARBITRATE;
        end
        TRANSFER1: begin
            if (ccif.ramstate == ACCESS) begin
                nextState = TRANSFER1_T;
                if (~requestor) begin
                    next_dwait[0] = 0;
                    next_dwait[1] = 0;
                end
                else begin
                    next_dwait[1] = 0;
                    next_dwait[0] = 0;
                end
            end

            ccif.ramWEN = 1;            
            if (~requestor) begin
                next_dload[0] = ccif.dstore[1];
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramstore = ccif.dstore[1];
            end
            else begin
                next_dload[1] = ccif.dstore[0];
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramstore = ccif.dstore[0];
            end
        end
        TRANSFER1_T: begin
            nextState = TRANSFER2;
        end
        TRANSFER2: begin
            if (ccif.ramstate == ACCESS) begin
                nextState = TRANSFER2_T;
                nextccinv = '0;
                nextccwait = '0;
                nextccsnoopaddr = '0;
                if (~requestor) begin
                    next_dwait[0] = 0;
                    next_dwait[1] = 0;
                end
                else begin
                    next_dwait[1] = 0;
                    next_dwait[0] = 0;
                end
            end
            
            ccif.ramWEN = 1;
            if (~requestor) begin
                next_dload[0] = ccif.dstore[1];
                ccif.ramaddr = ccif.daddr[1];
                ccif.ramstore = ccif.dstore[1];
            end
            else begin
                next_dload[1] = ccif.dstore[0];
                ccif.ramaddr = ccif.daddr[0];
                ccif.ramstore = ccif.dstore[0];
            end
        end
        TRANSFER2_T: begin
            nextState = ARBITRATE;
        end
        endcase
    end

endmodule