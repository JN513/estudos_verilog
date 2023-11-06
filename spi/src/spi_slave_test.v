module spi_slave(
    input clk,
    input reset,
    input cs,
    input mosi,
    output miso,
    input sck,
    output done,
    input [7:0] tx_data,
    output [7:0] rx_data
  );
 
  reg mosi_d, mosi_q;
  reg cs_d, cs_q;
  reg sck_d, sck_q;
  reg sck_old_d, sck_old_q;
  reg [7:0] data_d, data_q;
  reg done_d, done_q;
  reg [2:0] bit_ct_d, bit_ct_q;
  reg [7:0] rx_data_d, rx_data_q;
  reg miso_d, miso_q;
 
  assign miso = miso_q;
  assign done = done_q;
  assign rx_data = rx_data_q;
 
  always @(*) begin
    cs_d = cs;
    mosi_d = mosi;
    miso_d = miso_q;
    sck_d = sck;
    sck_old_d = sck_q;
    data_d = data_q;
    done_d = 1'b0;
    bit_ct_d = bit_ct_q;
    rx_data_d = rx_data_q;
 
    if (cs_q) begin                           // if slave select is high (deselcted)
      bit_ct_d = 3'b0;                        // reset bit counter
      data_d = tx_data;                           // read in data
      miso_d = data_q[7];                     // output MSB
    end else begin                            // else slave select is low (selected)
      if (!sck_old_q && sck_q) begin          // rising edge
        data_d = {data_q[6:0], mosi_q};       // read data in and shift
        bit_ct_d = bit_ct_q + 1'b1;           // increment the bit counter
        if (bit_ct_q == 3'b111) begin         // if we are on the last bit
          rx_data_d = {data_q[6:0], mosi_q};     // output the byte
          done_d = 1'b1;                      // set transfer done flag
          data_d = tx_data;                       // read in new byte
        end
      end else if (sck_old_q && !sck_q) begin // falling edge
        miso_d = data_q[7];                   // output MSB
      end
    end
  end
 
  always @(posedge clk) begin
    if (reset) begin
      done_q <= 1'b0;
      bit_ct_q <= 3'b0;
      rx_data_q <= 8'b0;
      miso_q <= 1'b1;
    end else begin
      done_q <= done_d;
      bit_ct_q <= bit_ct_d;
      rx_data_q <= rx_data_d;
      miso_q <= miso_d;
    end
 
    sck_q <= sck_d;
    mosi_q <= mosi_d;
    cs_q <= cs_d;
    data_q <= data_d;
    sck_old_q <= sck_old_d;
 
  end
 
endmodule