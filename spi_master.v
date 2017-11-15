`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//Description: This is a master controller for the Serial Peripheral Interface bus// 
////////////////////////////////////////////////////////////////////////////////////


module spi_master(
    input wire user_clk, user_rst,
    input wire MISO, 
    input wire user_in,
    input wire user_enable,	
    output user_status_out,
   // output sclk,
    output srst,
    output reg SS,
    output reg MOSI
);

    reg [2:0] s2p_count;
    reg [5:0] temp_s2p_out;
    reg [5:0] user_s2p_out;
    reg user_s2p_ready;
    reg [4:0] count;
    reg [1:0] dec_addr;
    reg [3:0] dec_data;
    reg spi_status;
    reg [18:0] spi_out;

    wire [14:0] adc_addr;

    assign adc_addr = 15'h0190;
  //  assign sclk = user_clk;
    assign srst = user_rst;

always @(posedge user_clk or negedge user_rst) begin

 if (user_enable) begin				//User selects SPI to do standalone Operations

    if (!user_rst) begin

       s2p_count <= 3'b0 ;
       temp_s2p_out <= 6'b0;
       user_s2p_ready <=1'b0;
	spi_out = 19'b0 ;

    end

//--------------Serial To Peripheral User interface-----------//

    else begin

	if (s2p_count <3'd6) begin
	   temp_s2p_out[s2p_count] <= user_in;
	   s2p_count <= s2p_count +1'b1;
	end

	   if (s2p_count == 3'd6) begin
	      user_s2p_out <= temp_s2p_out;
	      user_s2p_ready <= 1'b1;
	      s2p_count <= 3'b0;
	   end
	   else
	      user_s2p_ready <= 1'b0;
	
    end
 end			//if-user_enable
end


//--------------------Address and Data Decoder--------------//

always @(posedge user_s2p_ready) begin

 dec_addr <= user_s2p_out[5:4];
 dec_data <= user_s2p_out[3:0];

end

//--------------------Outputs of SPI-----------------------//

always @(posedge user_clk or negedge user_rst) begin

 
 if (!user_rst) begin
       count = 5'd0;
	MOSI = 0 ;
 end
	
 case (dec_addr) //begin

    2'b11 : begin

	spi_status = MISO;
	SS = 1'b1;

	if (spi_status)
	   SS = 1'b0;

	spi_out = {adc_addr,dec_data};

	if (count < 5'd19) begin
	   MOSI = spi_out [count];
	   count = count +1'b1;
	end
	else
	   count = 5'b0;
	end
    default : SS = 1'b0;
 endcase
end

assign user_status_out = spi_status;			//Output to outside world

endmodule
