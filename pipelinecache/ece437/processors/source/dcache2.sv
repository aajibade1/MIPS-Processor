`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "cpu_types_pkg.vh"

module dcache2 (
    input logic CLK, nRST,
    datapath_cache_if.dcache dcif,
    caches_if.dcache cif
);
    import cpu_types_pkg::*;

    //Cache controller states
    typedef enum logic [2:0] {
        COMPARE_TAG,
        WRITE_BACK,
        WRITE_BACK2,
        ALLOCATE,
        SNOOPCHK,
        SNOOPWB1,
        SNOOPWB2,
        STOMOD
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
    } dcacheStruct;

    typedef struct packed {
        word_t register;
        logic valid;
    } linkRegister;


    linkRegister linkReg;
    linkRegister nextLinkReg;

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
    logic nextBlockSel;
    logic blockSel;
    logic clear;
    logic nclear;
    logic atomic;
    logic nextAtomic;

    logic [31:0] hitCounter;
    logic [31:0] nextHitCounter;

    logic flush;
    logic nextFlushed;

    logic [2:0] haltIndex;
    logic [2:0] nextHaltIndex;
    logic [1:0] haltFrame;
    logic [1:0] nextHaltFrame;

    logic [25:0] snoopingTag;
    logic [2:0] snoopingIndex;

    logic [1:0] matchFrame;

    assign snoopingIndex = cif.ccsnoopaddr[5:3];
    assign snoopingTag = cif.ccsnoopaddr[31:6];
    assign matchFrame = (snoopingTag == dcache[snoopingIndex].frame[0].tag && dcache[snoopingIndex].frame[0].valid) ? 2'd0 : ((snoopingTag == dcache[snoopingIndex].frame[1].tag && dcache[snoopingIndex].frame[1].valid) ? 2'd1 : 2'd2);

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
            
            haltIndex <= '0;
            haltFrame <= '0;

            blockSel <= '0;

            linkReg <= '{default:'0};
            atomic <= 0;
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

            haltIndex <= nextHaltIndex;
            haltFrame <= nextHaltFrame;

            blockSel <= nextBlockSel;

            linkReg <= nextLinkReg;
            atomic <= nextAtomic;
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
        nextBlockSel = blockSel;
        dcif.flushed = flush;
        nextFlushed = flush;

        nclear = clear;

        next_dcache [7:0] = dcache [7:0];
        nextHitCounter = hitCounter; 

        nextLinkReg = linkReg;
        nextAtomic = atomic;

        //datapath outputs
        dcif.dhit = '0;
        dcif.dmemload = '0;
        //memory controller outputs
        cif.dREN = '0;
        cif.dWEN = '0;
        cif.daddr = '0;
        cif.dstore = '0;
        cif.cctrans = 0;
        cif.ccwrite = 0;

        nextHaltIndex = haltIndex;
        nextHaltFrame = haltFrame;

        casez(state)
        COMPARE_TAG: begin
            if (cif.ccwait) begin
                nextState = SNOOPCHK;
            end
            else if (dcif.halt) begin
                if (cif.ccwait || (cif.ccwait && cif.ccinv)) cif.cctrans = 1;
            
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
                    /*if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextIndex = 0;
                    nextFrameSel = 0;
                    cif.dWEN = 1;
                    cif.daddr =  32'h3100;//not sure
                    nextDaddr = 32'h3100;
                    cif.dstore = hitCounter;*/
                    nextFlushed = 1;
                end
                
            end
            else if (dcif.dmemREN) begin
                nextDaddr = dcif.dmemaddr;
                nextDoperation = 0; //read
                nextByteOffset = dcif.dmemaddr[2:0];
                nextIndex = dcif.dmemaddr[5:3];
                nextTag = dcif.dmemaddr[31:6];
                
                if (dcif.datomic) begin
                    nextLinkReg.register = nextDaddr;
                    nextLinkReg.valid = 1;
                    //nextAtomic = 1;
                end
                
                if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid) begin
                    //dirty or not, there is not state transition, cache has most update to date value
                    nextState = COMPARE_TAG;
                    nextFrameSel = 0;
                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                    dcif.dmemload = dcache[nextIndex].frame[0].block[nextByteOffset[2]];
                    next_dcache[nextIndex].lru = 1;
                end
                else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid) begin
                    nextState = COMPARE_TAG;
                    nextFrameSel = 1;
                    dcif.dhit = 1;
                    nextHitCounter = hitCounter + 1;
                    dcif.dmemload = dcache[nextIndex].frame[1].block[nextByteOffset[2]];
                    next_dcache[nextIndex].lru = 0;
                end
                else if (dcache[nextIndex].frame[0].dirty && ~dcache[nextIndex].lru) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextFrameSel = 0;
                    nextBlockSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[0].tag, nextIndex, 1'b0, 2'b00};
                    cif.dstore = dcache[nextIndex].frame[nextFrameSel].block[0];
                end
                else if (dcache[nextIndex].frame[1].dirty && dcache[nextIndex].lru) begin
                    if (~cif.dwait) nextState = WRITE_BACK;
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    nextFrameSel = 1;
                    nextBlockSel = 0;
                    cif.dWEN = 1;
                    cif.daddr = {dcache[nextIndex].frame[1].tag, nextIndex, 1'b0, 2'b00};
                    cif.dstore = dcache[nextIndex].frame[1].block[0];
                end
                else if (~dcache[nextIndex].lru) begin
                    if (~cif.dwait) begin
                        nextState = ALLOCATE;
                        next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                        next_dcache[nextIndex].frame[0].valid = 0;
                    end
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    cif.dREN = 1;

                    cif.cctrans = 1;

                    cif.daddr = nextDaddr;
                    nextFrameSel = 0;
                end
                else begin
                    if (~cif.dwait) begin
                        nextState = ALLOCATE;
                        next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                        next_dcache[nextIndex].frame[1].valid = 0;
                    end
                    else begin
                        nextState = COMPARE_TAG;
                    end
                    cif.dREN = 1;

                    cif.cctrans = 1;

                    cif.daddr = nextDaddr;
                    nextFrameSel = 1;
                end
            end
            else if (dcif.dmemWEN) begin
                nextDoperation = 1; //write
                nextStore = dcif.dmemstore;
                nextByteOffset = dcif.dmemaddr[2:0];
                nextIndex = dcif.dmemaddr[5:3];
                nextTag = dcif.dmemaddr[31:6];
                nextDaddr = dcif.dmemaddr;

                if (dcif.datomic) begin
                    //nextAtomic = 1;
                    if (linkReg.register == nextDaddr && linkReg.valid) begin
                        if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid && dcache[nextIndex].frame[0].dirty) begin
                            nextState = COMPARE_TAG;
                            nextFrameSel = 0;
                            next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = dcif.dmemstore;
                            next_dcache[nextIndex].frame[0].dirty = 1;
                            dcif.dhit = 1;
                            nextLinkReg.valid = 0;
                            dcif.dmemload = 1;
                            nextHitCounter = hitCounter + 1;
                            next_dcache[nextIndex].lru = 1;
                        end
                        else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid && dcache[nextIndex].frame[1].dirty) begin
                            nextState = COMPARE_TAG;
                            nextFrameSel = 1;
                            next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = dcif.dmemstore;
                            next_dcache[nextIndex].frame[1].dirty = 1;
                            dcif.dhit = 1;
                            nextLinkReg.valid = 0;
                            dcif.dmemload = 1;
                            nextHitCounter = hitCounter + 1;
                            next_dcache[nextIndex].lru = 0;
                        end
                        else if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid) begin
                            if (~cif.dwait) begin
                                nextState = STOMOD;
                                next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                                next_dcache[nextIndex].frame[0].valid = 0;
                            end
                            else nextState = COMPARE_TAG;

                            cif.dREN = 1;

                            cif.cctrans = 1;
                            cif.ccwrite = 1;

                            cif.daddr = nextDaddr;
                            nextFrameSel = 0;
                        end
                        else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid) begin
                            if (~cif.dwait) begin
                                nextState = STOMOD;
                                next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                                next_dcache[nextIndex].frame[1].valid = 0;
                            end
                            else begin
                                nextState = COMPARE_TAG;
                            end
                            cif.dREN = 1;

                            cif.cctrans = 1;
                            cif.ccwrite = 1;

                            cif.daddr = nextDaddr;
                            nextFrameSel = 1;
                        end
                        else if (dcache[nextIndex].frame[0].dirty && ~dcache[nextIndex].lru) begin
                            if (~cif.dwait) nextState = WRITE_BACK;
                            else begin
                                nextState = COMPARE_TAG;
                            end
                            nextFrameSel = 0;
                            cif.dWEN = 1;
                            cif.daddr = {dcache[nextIndex].frame[0].tag, nextIndex, 1'b0, 2'b00};
                            cif.dstore = dcache[nextIndex].frame[0].block[0];
                        end
                        else if (dcache[nextIndex].frame[1].dirty && dcache[nextIndex].lru) begin
                            if (~cif.dwait) nextState = WRITE_BACK;
                            else begin
                                nextState = COMPARE_TAG;
                            end
                            cif.dWEN = 1;
                            nextFrameSel = 1;
                            cif.daddr = {dcache[nextIndex].frame[1].tag, nextIndex, 1'b0, 2'b00};
                            cif.dstore = dcache[nextIndex].frame[1].block[0];
                        end
                        else if (~dcache[nextIndex].lru) begin
                            if (~cif.dwait) begin
                                nextState = ALLOCATE;
                                next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                                next_dcache[nextIndex].frame[0].valid = 0;
                            end
                            else begin
                                nextState = COMPARE_TAG;
                            end
                            cif.dREN = 1;

                            cif.cctrans = 1;
                            cif.ccwrite = 1;

                            cif.daddr = nextDaddr;
                            nextFrameSel = 0;
                        end
                        else begin
                            if (~cif.dwait) begin
                                nextState = ALLOCATE;
                                next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                                next_dcache[nextIndex].frame[1].valid = 0;
                            end
                            else begin
                                nextState = COMPARE_TAG;
                            end
                            cif.dREN = 1;

                            cif.cctrans = 1;
                            cif.ccwrite = 1;

                            cif.daddr = nextDaddr;
                            nextFrameSel = 1;
                        end
                    end
                    else begin
                        dcif.dmemload = '0;
                        dcif.dhit = 1;
                    end
                end
                else begin
                    //nextAtomic = 0;
                    if (linkReg.register == nextDaddr && linkReg.valid) begin
                        nextLinkReg.valid = 0;
                    end
                    
                    if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid && dcache[nextIndex].frame[0].dirty) begin
                        nextState = COMPARE_TAG;
                        nextFrameSel = 0;
                        next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = dcif.dmemstore;
                        next_dcache[nextIndex].frame[0].dirty = 1;
                        dcif.dhit = 1;
                        nextHitCounter = hitCounter + 1;
                        next_dcache[nextIndex].lru = 1;
                    end
                    else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid && dcache[nextIndex].frame[1].dirty) begin
                        nextState = COMPARE_TAG;
                        nextFrameSel = 1;
                        next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = dcif.dmemstore;
                        next_dcache[nextIndex].frame[1].dirty = 1;
                        dcif.dhit = 1;
                        nextHitCounter = hitCounter + 1;
                        next_dcache[nextIndex].lru = 0;
                    end
                    else if ((dcache[nextIndex].frame[0].tag == nextTag) && dcache[nextIndex].frame[0].valid) begin
                        if (~cif.dwait) begin
                            nextState = STOMOD;
                            next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[0].valid = 0;
                        end
                        else nextState = COMPARE_TAG;

                        cif.dREN = 1;

                        cif.cctrans = 1;
                        cif.ccwrite = 1;

                        cif.daddr = nextDaddr;
                        nextFrameSel = 0;
                    end
                    else if ((dcache[nextIndex].frame[1].tag == nextTag) && dcache[nextIndex].frame[1].valid) begin
                        if (~cif.dwait) begin
                            nextState = STOMOD;
                            next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[1].valid = 0;
                        end
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dREN = 1;

                        cif.cctrans = 1;
                        cif.ccwrite = 1;

                        cif.daddr = nextDaddr;
                        nextFrameSel = 1;
                    end
                    else if (dcache[nextIndex].frame[0].dirty && ~dcache[nextIndex].lru) begin
                        if (~cif.dwait) nextState = WRITE_BACK;
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        nextFrameSel = 0;
                        cif.dWEN = 1;
                        cif.daddr = {dcache[nextIndex].frame[0].tag, nextIndex, 1'b0, 2'b00};
                        cif.dstore = dcache[nextIndex].frame[0].block[0];
                    end
                    else if (dcache[nextIndex].frame[1].dirty && dcache[nextIndex].lru) begin
                        if (~cif.dwait) nextState = WRITE_BACK;
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dWEN = 1;
                        nextFrameSel = 1;
                        cif.daddr = {dcache[nextIndex].frame[1].tag, nextIndex, 1'b0, 2'b00};
                        cif.dstore = dcache[nextIndex].frame[1].block[0];
                    end
                    else if (~dcache[nextIndex].lru) begin
                        if (~cif.dwait) begin
                            nextState = ALLOCATE;
                            next_dcache[nextIndex].frame[0].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[0].valid = 0;
                        end
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dREN = 1;

                        cif.cctrans = 1;
                        cif.ccwrite = 1;

                        cif.daddr = nextDaddr;
                        nextFrameSel = 0;
                    end
                    else begin
                        if (~cif.dwait) begin
                            nextState = ALLOCATE;
                            next_dcache[nextIndex].frame[1].block[nextByteOffset[2]] = cif.dload;
                            next_dcache[nextIndex].frame[1].valid = 0;
                        end
                        else begin
                            nextState = COMPARE_TAG;
                        end
                        cif.dREN = 1;

                        cif.cctrans = 1;
                        cif.ccwrite = 1;

                        cif.daddr = nextDaddr;
                        nextFrameSel = 1;
                    end
                end
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
                cif.daddr = {dcache[index].frame[frameSel].tag, index, 1'b1, 2'b00};
                cif.dstore = dcache[index].frame[frameSel].block[1];
                
            end
        end
        WRITE_BACK2: begin
            if (dcif.halt) begin
                nextState = COMPARE_TAG;
                next_dcache[index].frame[frameSel].dirty = 0;
                next_dcache[index].frame[frameSel].valid = 0;
                nextHaltIndex = haltIndex + 1;
            end
            else begin
                cif.dREN = 1;

                if (~doperation) begin
                    cif.cctrans = 1;
                end
                else begin
                    cif.cctrans = 1;
                    cif.ccwrite = 1;
                end

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
        end
        ALLOCATE: begin
            if (~doperation) begin
                if (~cif.dwait) begin
                    dcif.dhit = 1;
                    dcif.dmemload = dcache[index].frame[frameSel].block[byteOffset[2]];
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
                cif.cctrans = 1;
                cif.daddr = {daddr[31:3], ~daddr[2], daddr[1:0]};
            end
            else if (doperation) begin
                if (~cif.dwait) begin
                    dcif.dhit = 1;

                    if (dcif.datomic) begin
                        dcif.dmemload = 1;
                        nextLinkReg.valid = 0;
                    end

                    nextState = COMPARE_TAG;
                    if (~dcache[index].lru) begin
                        next_dcache[index].frame[0].block[~byteOffset[2]] = cif.dload;
                        next_dcache[index].frame[0].valid = 1;


                        next_dcache[index].frame[0].block[byteOffset[2]] = store;
                        next_dcache[index].frame[0].dirty = 1;
                        next_dcache[index].frame[0].tag = tag;
                        next_dcache[index].lru = 1;
                    end
                    else begin
                        next_dcache[index].frame[1].block[~byteOffset[2]] = cif.dload;
                        next_dcache[index].frame[1].valid = 1;
                        
                        next_dcache[index].frame[1].block[byteOffset[2]] = store;
                        next_dcache[index].frame[1].dirty = 1;
                        next_dcache[index].frame[1].tag = tag;
                        next_dcache[index].lru = 0;
                    end
                end
                else begin
                    nextState = ALLOCATE;
                end
                cif.dREN = 1;
                cif.cctrans = 1;
                cif.ccwrite = 1;

                cif.daddr = {daddr[31:3], ~daddr[2], daddr[1:0]};
            end
        end
        STOMOD: begin
            if (!cif.dwait) begin
                dcif.dhit = 1;

                if (dcif.datomic) begin
                    dcif.dmemload = 1;
                    nextLinkReg.valid = 0;
                end

                nextState = COMPARE_TAG;
                
                next_dcache[index].frame[frameSel].block[~byteOffset[2]] = cif.dload;
                next_dcache[index].frame[frameSel].valid = 1;


                next_dcache[index].frame[frameSel].block[byteOffset[2]] = store;
                next_dcache[index].frame[frameSel].dirty = 1;
                next_dcache[index].frame[frameSel].tag = tag;

                next_dcache[index].lru = ~frameSel;
            end
            else begin
                nextState = STOMOD;
            end

            cif.dREN = 1;
            cif.cctrans = 1;
            cif.ccwrite = 1;
            cif.daddr = {daddr[31:3], ~daddr[2], daddr[1:0]};
        end
        SNOOPCHK: begin
            //if there is a match tag
            cif.cctrans = 1;

            if (matchFrame != 2'd2) begin
                //if cache needs to invalidate block (M->I)
                if (dcache[snoopingIndex].frame[matchFrame].dirty & cif.ccinv) begin
                    next_dcache[snoopingIndex].frame[matchFrame].dirty = 0;
                    next_dcache[snoopingIndex].frame[matchFrame].valid = 0;
                    
                    nextFrameSel = matchFrame;
                    nextIndex = snoopingIndex;
                    nextDaddr = cif.ccsnoopaddr;
                    nextTag = snoopingTag;

                    nextState = SNOOPWB1;
                    cif.ccwrite = 1;

                    if (linkReg.register == cif.ccsnoopaddr && linkReg.valid) begin
                        nextLinkReg.valid = 0;    
                    end
                end
                //IF CACHE needs to share block (M->S)
                else if (dcache[snoopingIndex].frame[matchFrame].dirty && !cif.ccinv) begin
                    next_dcache[snoopingIndex].frame[matchFrame].dirty = 0;
                    
                    nextFrameSel = matchFrame;
                    nextIndex = snoopingIndex;
                    nextDaddr = cif.ccsnoopaddr;
                    nextTag = snoopingTag;

                    cif.ccwrite = 1;
                    nextState = SNOOPWB1;
                end
                //if cache needs to invalidate block (S->I)
                else if (!dcache[snoopingIndex].frame[matchFrame].dirty && cif.ccinv) begin
                    next_dcache[snoopingIndex].frame[matchFrame].valid = 0;
                    nextState = COMPARE_TAG;

                    if (linkReg.register == cif.ccsnoopaddr && linkReg.valid) begin
                        nextLinkReg.valid = 0;    
                    end
                end
                else begin
                    nextState = COMPARE_TAG;
                end
            end 
            else begin
               nextState = COMPARE_TAG; 
            end
        end
        SNOOPWB1: begin
            cif.daddr = {dcache[index].frame[frameSel].tag, daddr[5:3], daddr[2], 2'b00};//3'b000};
            cif.dstore = dcache[index].frame[frameSel].block[daddr[2]];//not sure
            //cif.dWEN = 1;
            if (~cif.dwait) nextState = SNOOPWB2;
            else begin
                nextState = SNOOPWB1;
            end

        end
        SNOOPWB2: begin
            cif.daddr = {dcache[index].frame[frameSel].tag, daddr[5:3], ~daddr[2], 2'b00};
            cif.dstore = dcache[index].frame[frameSel].block[~daddr[2]];//not sure
            //cif.dWEN = 1;
            if (~cif.dwait) nextState = COMPARE_TAG;
            else begin
                nextState = SNOOPWB2;
            end 
        end
        endcase
    end



endmodule