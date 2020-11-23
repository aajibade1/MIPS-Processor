`include "cpu_types_pkg.vh"

module icache
(
    input CLK, nRST,
    datapath_cache_if.icache dcif,
    caches_if.icache cif
);
    import cpu_types_pkg::*;

    logic[3:0] cache_index;
    logic[25:0] incoming_tag;
    logic imiss;
    icache_frame cached_addr [15:0];
    icache_frame next_cached_addr [15:0];

    assign incoming_tag = dcif.imemaddr[31:6];
    assign cache_index = dcif.imemaddr[5:2];


    
    always_ff @ (posedge CLK, negedge nRST) begin
        if (~nRST) begin
            cached_addr <= '{'0, '0 ,'0, '0, '0, '0, '0, '0, '0, '0, '0, '0, '0, '0, '0, '0};
        end
        else begin
            /*if(~cif.iwait) begin
			 cached_addr[cache_index].tag <= dcif.imemaddr[31:6];
			 cached_addr[cache_index].data <= cif.iload;
			 cached_addr[cache_index].valid <= 1;
            end*/
            cached_addr [15:0] <= next_cached_addr [15:0];
        end
     end

     always_comb begin
         dcif.ihit = 0;
         dcif.imemload = '0;
         cif.iREN = 0;
         cif.iaddr = '0;
         imiss = 1;
         next_cached_addr [15:0] = cached_addr [15:0];
        
        if(dcif.imemREN) begin
            if ((cached_addr[cache_index].tag == incoming_tag) &&  (cached_addr[cache_index].valid == 1)) begin
                
                dcif.ihit = 1;
                dcif.imemload = cached_addr[cache_index].data;
                imiss = 0;
            end
            else begin
                if (~cif.iwait) begin
                    next_cached_addr[cache_index].tag = dcif.imemaddr[31:6];
                    next_cached_addr[cache_index].data = cif.iload;
                    next_cached_addr[cache_index].valid = 1;

                    dcif.ihit = 1;
                    dcif.imemload = next_cached_addr[cache_index].data;
                    imiss = 0;
                end

                cif.iREN = 1;
                cif.iaddr = dcif.imemaddr;
            end 
        end
     end
endmodule