`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "cpu_types_pkg.vh"

module dcache (
    input logic CLK, nRST,
    datapath_cache_if.dcache dcif,
    caches_if.dcache cif
);
    import cpu_types_pkg::*;

    //Cache controller states
    typedef enum logic [1:0] {
        COMPARE_TAG = 2'b00,
        WRITE_BACK = 2'b01,
        WRITE_BACK2 = 2'b10,
        ALLOCATE = 2'b11
    }dcacheState;


    typedef struct packed {
        logic valid;
        logic dirty;
        logic [25:0] tag;
        word_t [1:0] block;
    } dcacheFrame;

    typedef struct packed {
        dcacheFrame [1:0] frame;
        logic lru;
    }dcacheStruct;

    dcacheStruct dcache [7:0];
    dcacheStruct next_dcache [7:0];
    dcacheState state;
    dcacheState nextState;

    logic[25:0] tag;
    logic [2:0] index;
    logic frameSel;
    logic [2:0] byteOffset;
    logic[31:0] daddr;
    logic doperation;
    word_t store;

    logic [25:0] nextTag;
    logic [2:0] nextIndex;
    logic [2:0] nextByteOffset;
    logic [31:0] nextDaddr;
    logic nextDoperation;
    word_t nextStore;
    logic nextFrameSel;

    logic clear;
    logic nclear;

    logic [31:0] hitCounter;
    logic [31:0] nextHitCounter;

    logic flush;
    logic nextFlushed;


    always_ff @ (posedge CLK, negedge nRST) begin
        if (nRST == 0) begin
            dcache <= '{default:'0};
            state <= COMPARE_TAG;
            index <= '0;
            frameSel <= 0;
            tag <= '0;
            daddr <= '0;
            doperation <= '0;
            store <= '0;
            clear <= '0;
            hitCounter <= '0;
            byteOffset <= '0;
            flush <= '0;
        end
        else begin
            dcache <= next_dcache;
            state <= nextState;
            index <= nextIndex;
            tag <= nextTag;
            frameSel <= nextFrameSel;
            daddr <= nextDaddr;
            doperation <= nextDoperation;
            store <= nextStore;
            clear <= nclear;
            hitCounter <= nextHitCounter;
            byteOffset <= nextByteOffset;
            flush <= nextFlushed;
        end
    end

    always_comb begin
        nextState = state;
        nextByteOffset = byteOffset;
        nextIndex = index;
        nextFrameSel = frameSel;
        nextTag = tag;
        nextDaddr = daddr;
        nextDoperation = doperation;
        nextStore = store;
        
        dcif.flushed = flush;
        nextFlushed = flush;

        nclear = clear;

        next_dcache [7:0] = dcache [7:0];
        nextHitCounter = hitCounter; 

        //datapath outputs
        dcif.dhit = '0;
        dcif.dmemload = '0;
        //memory controller outputs
        cif.dREN = '0;
        cif.dWEN = '0;
        cif.daddr = '0;
        cif.dstore = '0;

        casez(state)
        COMPARE_TAG: begin
            if (dcif.halt) begin
                if (dcache[0].frame[0].dirty && dcache[0].frame[0].valid) begin
                    cif.dWEN = 1;
                    nextIndex = 0;
                    nextFrameSel = 0;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                end
                else if (dcache[1].frame[0].dirty && dcache[1].frame[0].valid) begin
                    nextIndex = 1;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    
                end
                else if (dcache[2].frame[0].dirty && dcache[2].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 2;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[3].frame[0].dirty && dcache[3].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 3;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[4].frame[0].dirty && dcache[4].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 4;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[5].frame[0].dirty && dcache[5].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 5;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[6].frame[0].dirty && dcache[6].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 6;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[7].frame[0].dirty && dcache[7].frame[0].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 7;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[0].frame[1].dirty && dcache[0].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 0;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[1].frame[1].dirty && dcache[1].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 1;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[2].frame[1].dirty && dcache[2].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 2;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[3].frame[1].dirty && dcache[3].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 3;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[4].frame[1].dirty && dcache[4].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 4;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[5].frame[1].dirty && dcache[5].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 5;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[6].frame[1].dirty && dcache[6].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 6;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[7].frame[1].dirty && dcache[7].frame[1].valid) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 7;
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[nextFrameSel].tag, nextIndex, 3'b000}; //not sure
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 0;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr =  32'h3100;//not sure
                    nextDaddr = 32'h3100;
                    cif.dstore = hitCounter;
                end 
            end
            else if (dcif.dmemREN) begin
                nextDaddr = dcif.dmemaddr;
                nextDoperation = 0; //read
                nextByteOffset = dcif.dmemaddr[2:0];
                nextIndex = dcif.dmemaddr[5:3];
                nextTag = dcif.dmemaddr[31:6];
                

                if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid) begin
                    nextState = COMPARE_TAG;
                    //nextByteOffset = '0;
                    //nextIndex = '0;
                    //nextTag = '0;

                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                    dcif.dmemload = dcache[nextIndex].frame[0].block[nextByteOffset[2]];
                end
                else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid) begin
                    nextState = COMPARE_TAG;
                    //nextByteOffset = '0;
                    //nextIndex = '0;
                    //nextTag = '0;

                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                    dcif.dmemload = dcache[nextIndex].frame[1].block[nextByteOffset[2]];
                end
                else if (dcache[nextIndex].frame[0].dirty && ~dcache[nextIndex].lru) begin
                    //nextState = WRITE_BACK;
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[0].tag, nextIndex, 1'b0, 2'b00};
                    //cif.dstore = dcache[nextIndex].frame[0].block[nextByteOffset[2]];
                    cif.dstore = dcache[nextIndex].frame[0].block[0];
                end
                else if (dcache[nextIndex].frame[1].dirty && dcache[nextIndex].lru) begin
                    //nextState = WRITE_BACK;
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextFrameSel = 1;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[1].tag, nextIndex, 1'b0, 2'b00};
                    //cif.dstore = dcache[nextIndex].frame[1].block[nextByteOffset[2]];
                    cif.dstore = dcache[nextIndex].frame[1].block[0];
                end
                else begin
                    if (~dcache[nextIndex].lru) begin
                        //nextState = ALLOCATE;
                        if (~cif.dwait) begin
                            nextState = ALLOCATE;
                            next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[0].valid = 0;
                        end
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dREN = 1;
                        cif.daddr = nextDaddr;
                    end
                    else begin
                        //nextState = ALLOCATE;
                        if (~cif.dwait) begin
                            nextState = ALLOCATE;
                            next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[1].valid = 0;
                        end
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dREN = 1;
                            cif.daddr = nextDaddr;
                    end
                end
            end
            else if (dcif.dmemWEN) begin
                nextDoperation = 1; //write
                nextStore = dcif.dmemstore;
                nextByteOffset = dcif.dmemaddr[2:0];
                nextIndex = dcif.dmemaddr[5:3];
                nextTag = dcif.dmemaddr[31:6];
                nextDaddr = dcif.dmemaddr;

                if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid) begin
                    nextState = COMPARE_TAG;
                    //nextByteOffset = '0;
                    //nextIndex = '0;
                    //nextTag = '0;

                    next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = dcif.dmemstore;
                    next_dcache[nextIndex].frame[0].dirty = 1;
                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                end
                else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid) begin
                    nextState = COMPARE_TAG;
                    //nextByteOffset = '0;
                    //nextIndex = '0;
                    //nextTag = '0;
                    
                    next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = dcif.dmemstore;
                    next_dcache[nextIndex].frame[1].dirty = 1;
                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                end
                else if (dcache[nextIndex].frame[0].dirty && ~dcache[nextIndex].lru) begin
                    //nextState = WRITE_BACK;
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[0].tag, nextIndex, 1'b0, 2'b00};
                    cif.dstore = dcache[nextIndex].frame[0].block[0];
                end
                else if (dcache[nextIndex].frame[1].dirty && dcache[nextIndex].lru) begin
                    //nextState = WRITE_BACK;
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[1].tag, nextIndex, 1'b0, 2'b00};
                    cif.dstore = dcache[nextIndex].frame[1].block[0];
                end
                else begin
                    if (~dcache[nextIndex].lru) begin
                        nextState = ALLOCATE;
                    end
                    else begin
                        nextState = ALLOCATE;
                    end
                end
            end
            else begin
                nextState = COMPARE_TAG;
                nextByteOffset = '0;
                nextIndex = '0;
                nextTag = '0;
                nextDaddr = '0;
            end
        end
        WRITE_BACK: begin
            if (dcif.halt && daddr == 32'h3100) begin
                    nextState = COMPARE_TAG;
                    nclear = 1;
                    nextFlushed = 1;
            end
            else begin
                if (~cif.dwait) nextState = WRITE_BACK2;
                else begin
                    nextState = WRITE_BACK;
                end
                cif.dWEN = 1;
                cif.daddr = {dcache[nextIndex].frame[frameSel].tag, nextIndex, 1'b1, 2'b00};
                cif.dstore = dcache[nextIndex].frame[frameSel].block[1];
                
            end
        end
        WRITE_BACK2: begin
            if (dcif.halt) begin
                nextState = COMPARE_TAG;
                next_dcache[index].frame[frameSel].dirty = 0;
            end
            else begin
                if (~doperation) begin
                    cif.dREN = 1;
                    cif.daddr = daddr;
                    if (cif.dwait) begin
                        nextState = WRITE_BACK2;
                    end
                    else begin
                        nextState = ALLOCATE;
                        if (dcache[index].lru) begin
                            next_dcache[index].frame[1].block[byteOffset[2]] = cif.dload;
                            next_dcache[index].frame[1].valid = 0;
                        end
                        else if (~dcache[index].lru) begin
                            next_dcache[index].frame[0].block[byteOffset[2]] = cif.dload;
                            next_dcache[index].frame[0].valid = 0;
                        end
                    end
                end
                else begin
                    nextState = ALLOCATE;
                end
            end
        end
        ALLOCATE: begin
            if (~doperation) begin
                if (~cif.dwait) begin
                    dcif.dhit = 1;
                    dcif.dmemload = dcache[index].frame[frameSel].block[daddr[2]];
                    nextState = COMPARE_TAG;
                    if (~dcache[index].lru) begin
                        next_dcache[index].frame[0].block[~byteOffset[2]] = cif.dload;
                        next_dcache[index].frame[0].dirty = 0;
                        next_dcache[index].frame[0].valid = 1;
                        next_dcache[index].frame[0].tag = tag;
                        next_dcache[index].lru = 1;
                    end
                    else begin
                        next_dcache[index].frame[1].block[~byteOffset[2]] = cif.dload;
                        next_dcache[index].frame[1].dirty = 0;
                        next_dcache[index].frame[1].valid = 1;
                        next_dcache[index].frame[1].tag = tag;
                        next_dcache[index].lru = 0;
                    end
                end
                else begin
                    nextState = ALLOCATE;
                end
                cif.dREN = 1;
                cif.daddr = {daddr[31:3], ~daddr[2], daddr[1:0]};
            end
            else if (doperation) begin
                dcif.dhit = 1;
                nextState = COMPARE_TAG;
                if (dcache[index].lru) begin
                    next_dcache[index].frame[1].block[byteOffset[2]] = store;
                    next_dcache[index].frame[1].dirty = 1;
                    next_dcache[index].frame[1].valid = 1;
                    next_dcache[index].frame[1].tag = tag;
                    next_dcache[index].lru = 0;
                end
                else if (~dcache[index].lru) begin
                    next_dcache[index].frame[0].block[byteOffset[2]] = store;
                    next_dcache[index].frame[0].dirty = 1;
                    next_dcache[index].frame[0].valid = 1;
                    next_dcache[index].frame[0].tag = tag;
                    next_dcache[index].lru = 1;
                end
            end
        end
        endcase
    end



endmodule