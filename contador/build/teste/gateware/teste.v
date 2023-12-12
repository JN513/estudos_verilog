// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : teste.v
// Device     : 
// LiteX sha1 : 112f78bd
// Date       : 2023-11-24 17:19:34
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module teste (
    input  wire          clk,
    output reg     [7:0] debug,
    input  wire          mmap_m_ack,
    output wire   [29:0] mmap_m_adr,
    output wire    [1:0] mmap_m_bte,
    output wire    [2:0] mmap_m_cti,
    output wire          mmap_m_cyc,
    input  wire   [31:0] mmap_m_dat_r,
    output wire   [31:0] mmap_m_dat_w,
    input  wire          mmap_m_err,
    output wire    [3:0] mmap_m_sel,
    output wire          mmap_m_stb,
    output wire          mmap_m_we,
    output wire          mmap_s_ack,
    input  wire   [29:0] mmap_s_adr,
    input  wire    [1:0] mmap_s_bte,
    input  wire    [2:0] mmap_s_cti,
    input  wire          mmap_s_cyc,
    output wire   [31:0] mmap_s_dat_r,
    input  wire   [31:0] mmap_s_dat_w,
    output wire          mmap_s_err,
    input  wire    [3:0] mmap_s_sel,
    input  wire          mmap_s_stb,
    input  wire          mmap_s_we,
    input  wire          rst
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

reg    [19:0] builder_count = 20'd1000000;
wire    [5:0] builder_csr_bankarray_adr;
wire    [7:0] builder_csr_bankarray_dat_r;
wire          builder_csr_bankarray_sel;
reg           builder_csr_bankarray_sel_r = 1'd0;
wire   [13:0] builder_csr_bankarray_sram_bus_adr;
reg    [31:0] builder_csr_bankarray_sram_bus_dat_r = 32'd0;
wire   [31:0] builder_csr_bankarray_sram_bus_dat_w;
wire          builder_csr_bankarray_sram_bus_we;
wire   [13:0] builder_csr_interconnect_adr;
wire   [31:0] builder_csr_interconnect_dat_r;
wire   [31:0] builder_csr_interconnect_dat_w;
wire          builder_csr_interconnect_we;
wire          builder_done;
reg           builder_error = 1'd0;
wire          builder_grant;
reg    [13:0] builder_litexsocgenerator_adr = 14'd0;
wire   [31:0] builder_litexsocgenerator_dat_r;
reg    [31:0] builder_litexsocgenerator_dat_w = 32'd0;
reg           builder_litexsocgenerator_next_state = 1'd0;
reg           builder_litexsocgenerator_state = 1'd0;
reg           builder_litexsocgenerator_we = 1'd0;
reg           builder_litexsocgenerator_wishbone_ack = 1'd0;
wire   [29:0] builder_litexsocgenerator_wishbone_adr;
wire    [1:0] builder_litexsocgenerator_wishbone_bte;
wire    [2:0] builder_litexsocgenerator_wishbone_cti;
wire          builder_litexsocgenerator_wishbone_cyc;
reg    [31:0] builder_litexsocgenerator_wishbone_dat_r = 32'd0;
wire   [31:0] builder_litexsocgenerator_wishbone_dat_w;
reg           builder_litexsocgenerator_wishbone_err = 1'd0;
wire    [3:0] builder_litexsocgenerator_wishbone_sel;
wire          builder_litexsocgenerator_wishbone_stb;
wire          builder_litexsocgenerator_wishbone_we;
reg     [2:0] builder_master = 3'd0;
wire          builder_request;
reg    [29:0] builder_self0 = 30'd0;
reg    [31:0] builder_self1 = 32'd0;
reg     [3:0] builder_self2 = 4'd0;
reg           builder_self3 = 1'd0;
reg           builder_self4 = 1'd0;
reg           builder_self5 = 1'd0;
reg     [2:0] builder_self6 = 3'd0;
reg     [1:0] builder_self7 = 2'd0;
reg           builder_shared_ack = 1'd0;
wire   [29:0] builder_shared_adr;
wire    [1:0] builder_shared_bte;
wire    [2:0] builder_shared_cti;
wire          builder_shared_cyc;
reg    [31:0] builder_shared_dat_r = 32'd0;
wire   [31:0] builder_shared_dat_w;
wire          builder_shared_err;
wire    [3:0] builder_shared_sel;
wire          builder_shared_stb;
wire          builder_shared_we;
reg     [2:0] builder_slaves = 3'd0;
wire          builder_wait;
reg           main_int_rst = 1'd1;
wire          main_interface0_ack;
wire   [29:0] main_interface0_adr;
wire    [1:0] main_interface0_bte;
wire    [2:0] main_interface0_cti;
wire          main_interface0_cyc;
wire   [31:0] main_interface0_dat_r;
wire   [31:0] main_interface0_dat_w;
wire          main_interface0_err;
wire    [3:0] main_interface0_sel;
wire          main_interface0_stb;
wire          main_interface0_we;
wire          main_interface1_ack;
wire   [29:0] main_interface1_adr;
wire    [1:0] main_interface1_bte;
wire    [2:0] main_interface1_cti;
wire          main_interface1_cyc;
wire   [31:0] main_interface1_dat_r;
wire   [31:0] main_interface1_dat_w;
wire          main_interface1_err;
wire    [3:0] main_interface1_sel;
wire          main_interface1_stb;
wire          main_interface1_we;
wire   [10:0] main_litexsocgenerator_adr;
reg           main_litexsocgenerator_adr_burst = 1'd0;
wire   [31:0] main_litexsocgenerator_dat_r;
wire   [31:0] main_litexsocgenerator_dat_w;
reg           main_litexsocgenerator_ram_bus_ack = 1'd0;
wire   [29:0] main_litexsocgenerator_ram_bus_adr;
wire    [1:0] main_litexsocgenerator_ram_bus_bte;
wire    [2:0] main_litexsocgenerator_ram_bus_cti;
wire          main_litexsocgenerator_ram_bus_cyc;
wire   [31:0] main_litexsocgenerator_ram_bus_dat_r;
wire   [31:0] main_litexsocgenerator_ram_bus_dat_w;
reg           main_litexsocgenerator_ram_bus_err = 1'd0;
wire    [3:0] main_litexsocgenerator_ram_bus_sel;
wire          main_litexsocgenerator_ram_bus_stb;
wire          main_litexsocgenerator_ram_bus_we;
reg     [3:0] main_litexsocgenerator_we = 4'd0;
wire          por_clk;
wire          sys_clk;
wire          sys_rst;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign main_interface0_adr = mmap_s_adr;
assign main_interface0_dat_w = mmap_s_dat_w;
assign mmap_s_dat_r = main_interface0_dat_r;
assign main_interface0_sel = mmap_s_sel;
assign main_interface0_cyc = mmap_s_cyc;
assign main_interface0_stb = mmap_s_stb;
assign mmap_s_ack = main_interface0_ack;
assign main_interface0_we = mmap_s_we;
assign main_interface0_cti = mmap_s_cti;
assign main_interface0_bte = mmap_s_bte;
assign mmap_s_err = main_interface0_err;
assign mmap_m_adr = main_interface1_adr;
assign mmap_m_dat_w = main_interface1_dat_w;
assign main_interface1_dat_r = mmap_m_dat_r;
assign mmap_m_sel = main_interface1_sel;
assign mmap_m_cyc = main_interface1_cyc;
assign mmap_m_stb = main_interface1_stb;
assign main_interface1_ack = mmap_m_ack;
assign mmap_m_we = main_interface1_we;
assign mmap_m_cti = main_interface1_cti;
assign mmap_m_bte = main_interface1_bte;
assign main_interface1_err = mmap_m_err;
always @(*) begin
    debug <= 8'd0;
    debug[0] <= 1'd0;
    debug[1] <= 1'd1;
end
assign sys_clk = clk;
assign por_clk = clk;
assign sys_rst = main_int_rst;
assign builder_shared_adr = builder_self0;
assign builder_shared_dat_w = builder_self1;
assign builder_shared_sel = builder_self2;
assign builder_shared_cyc = builder_self3;
assign builder_shared_stb = builder_self4;
assign builder_shared_we = builder_self5;
assign builder_shared_cti = builder_self6;
assign builder_shared_bte = builder_self7;
assign main_interface0_dat_r = builder_shared_dat_r;
assign main_interface0_ack = (builder_shared_ack & (builder_grant == 1'd0));
assign main_interface0_err = (builder_shared_err & (builder_grant == 1'd0));
assign builder_request = {main_interface0_cyc};
assign builder_grant = 1'd0;
always @(*) begin
    builder_master <= 3'd0;
    builder_master[0] <= (builder_shared_adr[29:11] == 12'd2048);
    builder_master[1] <= (builder_shared_adr[29:26] == 4'd10);
    builder_master[2] <= (builder_shared_adr[29:14] == 1'd0);
end
assign main_litexsocgenerator_ram_bus_adr = builder_shared_adr;
assign main_litexsocgenerator_ram_bus_dat_w = builder_shared_dat_w;
assign main_litexsocgenerator_ram_bus_sel = builder_shared_sel;
assign main_litexsocgenerator_ram_bus_stb = builder_shared_stb;
assign main_litexsocgenerator_ram_bus_we = builder_shared_we;
assign main_litexsocgenerator_ram_bus_cti = builder_shared_cti;
assign main_litexsocgenerator_ram_bus_bte = builder_shared_bte;
assign main_interface1_adr = builder_shared_adr;
assign main_interface1_dat_w = builder_shared_dat_w;
assign main_interface1_sel = builder_shared_sel;
assign main_interface1_stb = builder_shared_stb;
assign main_interface1_we = builder_shared_we;
assign main_interface1_cti = builder_shared_cti;
assign main_interface1_bte = builder_shared_bte;
assign builder_litexsocgenerator_wishbone_adr = builder_shared_adr;
assign builder_litexsocgenerator_wishbone_dat_w = builder_shared_dat_w;
assign builder_litexsocgenerator_wishbone_sel = builder_shared_sel;
assign builder_litexsocgenerator_wishbone_stb = builder_shared_stb;
assign builder_litexsocgenerator_wishbone_we = builder_shared_we;
assign builder_litexsocgenerator_wishbone_cti = builder_shared_cti;
assign builder_litexsocgenerator_wishbone_bte = builder_shared_bte;
assign main_litexsocgenerator_ram_bus_cyc = (builder_shared_cyc & builder_master[0]);
assign main_interface1_cyc = (builder_shared_cyc & builder_master[1]);
assign builder_litexsocgenerator_wishbone_cyc = (builder_shared_cyc & builder_master[2]);
assign builder_shared_err = ((main_litexsocgenerator_ram_bus_err | main_interface1_err) | builder_litexsocgenerator_wishbone_err);
assign builder_wait = ((builder_shared_stb & builder_shared_cyc) & (~builder_shared_ack));
always @(*) begin
    builder_error <= 1'd0;
    builder_shared_ack <= 1'd0;
    builder_shared_dat_r <= 32'd0;
    builder_shared_ack <= ((main_litexsocgenerator_ram_bus_ack | main_interface1_ack) | builder_litexsocgenerator_wishbone_ack);
    builder_shared_dat_r <= ((({32{builder_slaves[0]}} & main_litexsocgenerator_ram_bus_dat_r) | ({32{builder_slaves[1]}} & main_interface1_dat_r)) | ({32{builder_slaves[2]}} & builder_litexsocgenerator_wishbone_dat_r));
    if (builder_done) begin
        builder_shared_dat_r <= 32'd4294967295;
        builder_shared_ack <= 1'd1;
        builder_error <= 1'd1;
    end
end
assign builder_done = (builder_count == 1'd0);
always @(*) begin
    main_litexsocgenerator_we <= 4'd0;
    main_litexsocgenerator_we[0] <= (((main_litexsocgenerator_ram_bus_cyc & main_litexsocgenerator_ram_bus_stb) & main_litexsocgenerator_ram_bus_we) & main_litexsocgenerator_ram_bus_sel[0]);
    main_litexsocgenerator_we[1] <= (((main_litexsocgenerator_ram_bus_cyc & main_litexsocgenerator_ram_bus_stb) & main_litexsocgenerator_ram_bus_we) & main_litexsocgenerator_ram_bus_sel[1]);
    main_litexsocgenerator_we[2] <= (((main_litexsocgenerator_ram_bus_cyc & main_litexsocgenerator_ram_bus_stb) & main_litexsocgenerator_ram_bus_we) & main_litexsocgenerator_ram_bus_sel[2]);
    main_litexsocgenerator_we[3] <= (((main_litexsocgenerator_ram_bus_cyc & main_litexsocgenerator_ram_bus_stb) & main_litexsocgenerator_ram_bus_we) & main_litexsocgenerator_ram_bus_sel[3]);
end
assign main_litexsocgenerator_adr = main_litexsocgenerator_ram_bus_adr[10:0];
assign main_litexsocgenerator_ram_bus_dat_r = main_litexsocgenerator_dat_r;
assign main_litexsocgenerator_dat_w = main_litexsocgenerator_ram_bus_dat_w;
always @(*) begin
    builder_litexsocgenerator_adr <= 14'd0;
    builder_litexsocgenerator_dat_w <= 32'd0;
    builder_litexsocgenerator_next_state <= 1'd0;
    builder_litexsocgenerator_we <= 1'd0;
    builder_litexsocgenerator_wishbone_ack <= 1'd0;
    builder_litexsocgenerator_wishbone_dat_r <= 32'd0;
    builder_litexsocgenerator_next_state <= builder_litexsocgenerator_state;
    case (builder_litexsocgenerator_state)
        1'd1: begin
            builder_litexsocgenerator_wishbone_ack <= 1'd1;
            builder_litexsocgenerator_wishbone_dat_r <= builder_litexsocgenerator_dat_r;
            builder_litexsocgenerator_next_state <= 1'd0;
        end
        default: begin
            builder_litexsocgenerator_dat_w <= builder_litexsocgenerator_wishbone_dat_w;
            if ((builder_litexsocgenerator_wishbone_cyc & builder_litexsocgenerator_wishbone_stb)) begin
                builder_litexsocgenerator_adr <= builder_litexsocgenerator_wishbone_adr;
                builder_litexsocgenerator_we <= (builder_litexsocgenerator_wishbone_we & (builder_litexsocgenerator_wishbone_sel != 1'd0));
                builder_litexsocgenerator_next_state <= 1'd1;
            end
        end
    endcase
end
assign builder_csr_bankarray_sel = (builder_csr_bankarray_sram_bus_adr[13:9] == 1'd0);
always @(*) begin
    builder_csr_bankarray_sram_bus_dat_r <= 32'd0;
    if (builder_csr_bankarray_sel_r) begin
        builder_csr_bankarray_sram_bus_dat_r <= builder_csr_bankarray_dat_r;
    end
end
assign builder_csr_bankarray_adr = builder_csr_bankarray_sram_bus_adr[5:0];
assign builder_csr_interconnect_adr = builder_litexsocgenerator_adr;
assign builder_csr_interconnect_we = builder_litexsocgenerator_we;
assign builder_csr_interconnect_dat_w = builder_litexsocgenerator_dat_w;
assign builder_litexsocgenerator_dat_r = builder_csr_interconnect_dat_r;
assign builder_csr_bankarray_sram_bus_adr = builder_csr_interconnect_adr;
assign builder_csr_bankarray_sram_bus_we = builder_csr_interconnect_we;
assign builder_csr_bankarray_sram_bus_dat_w = builder_csr_interconnect_dat_w;
assign builder_csr_interconnect_dat_r = builder_csr_bankarray_sram_bus_dat_r;
always @(*) begin
    builder_self0 <= 30'd0;
    case (builder_grant)
        default: begin
            builder_self0 <= main_interface0_adr;
        end
    endcase
end
always @(*) begin
    builder_self1 <= 32'd0;
    case (builder_grant)
        default: begin
            builder_self1 <= main_interface0_dat_w;
        end
    endcase
end
always @(*) begin
    builder_self2 <= 4'd0;
    case (builder_grant)
        default: begin
            builder_self2 <= main_interface0_sel;
        end
    endcase
end
always @(*) begin
    builder_self3 <= 1'd0;
    case (builder_grant)
        default: begin
            builder_self3 <= main_interface0_cyc;
        end
    endcase
end
always @(*) begin
    builder_self4 <= 1'd0;
    case (builder_grant)
        default: begin
            builder_self4 <= main_interface0_stb;
        end
    endcase
end
always @(*) begin
    builder_self5 <= 1'd0;
    case (builder_grant)
        default: begin
            builder_self5 <= main_interface0_we;
        end
    endcase
end
always @(*) begin
    builder_self6 <= 3'd0;
    case (builder_grant)
        default: begin
            builder_self6 <= main_interface0_cti;
        end
    endcase
end
always @(*) begin
    builder_self7 <= 2'd0;
    case (builder_grant)
        default: begin
            builder_self7 <= main_interface0_bte;
        end
    endcase
end


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------

always @(posedge por_clk) begin
    main_int_rst <= rst;
end

always @(posedge sys_clk) begin
    builder_slaves <= builder_master;
    if (builder_wait) begin
        if ((~builder_done)) begin
            builder_count <= (builder_count - 1'd1);
        end
    end else begin
        builder_count <= 20'd1000000;
    end
    main_litexsocgenerator_ram_bus_ack <= 1'd0;
    if (((main_litexsocgenerator_ram_bus_cyc & main_litexsocgenerator_ram_bus_stb) & ((~main_litexsocgenerator_ram_bus_ack) | main_litexsocgenerator_adr_burst))) begin
        main_litexsocgenerator_ram_bus_ack <= 1'd1;
    end
    builder_litexsocgenerator_state <= builder_litexsocgenerator_next_state;
    builder_csr_bankarray_sel_r <= builder_csr_bankarray_sel;
    if (sys_rst) begin
        main_litexsocgenerator_ram_bus_ack <= 1'd0;
        builder_slaves <= 3'd0;
        builder_count <= 20'd1000000;
        builder_csr_bankarray_sel_r <= 1'd0;
        builder_litexsocgenerator_state <= 1'd0;
    end
end


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Memory sram: 2048-words x 32-bit
//------------------------------------------------------------------------------
// Port 0 | Read: Sync  | Write: Sync | Mode: Write-First | Write-Granularity: 8 
reg [31:0] sram[0:2047];
initial begin
	$readmemh("teste_sram.init", sram);
end
reg [10:0] sram_adr0;
always @(posedge sys_clk) begin
	if (main_litexsocgenerator_we[0])
		sram[main_litexsocgenerator_adr][7:0] <= main_litexsocgenerator_dat_w[7:0];
	if (main_litexsocgenerator_we[1])
		sram[main_litexsocgenerator_adr][15:8] <= main_litexsocgenerator_dat_w[15:8];
	if (main_litexsocgenerator_we[2])
		sram[main_litexsocgenerator_adr][23:16] <= main_litexsocgenerator_dat_w[23:16];
	if (main_litexsocgenerator_we[3])
		sram[main_litexsocgenerator_adr][31:24] <= main_litexsocgenerator_dat_w[31:24];
	sram_adr0 <= main_litexsocgenerator_adr;
end
assign main_litexsocgenerator_dat_r = sram[sram_adr0];


//------------------------------------------------------------------------------
// Memory mem: 49-words x 8-bit
//------------------------------------------------------------------------------
// Port 0 | Read: Sync  | Write: ---- | 
reg [7:0] mem[0:48];
initial begin
	$readmemh("teste_mem.init", mem);
end
reg [5:0] mem_adr0;
always @(posedge sys_clk) begin
	mem_adr0 <= builder_csr_bankarray_adr;
end
assign builder_csr_bankarray_dat_r = mem[mem_adr0];


endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2023-11-24 17:19:34.
//------------------------------------------------------------------------------
