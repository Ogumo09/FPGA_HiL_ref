// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\hdlcoder_led_blinking_4bit\led_count_ip.v
// Created: 2023-03-21 17:20:25
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: -1
// Target subsystem base rate: -1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: led_count_ip
// Source Path: led_count_ip
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module led_count_ip
          (IPCORE_CLK,
           IPCORE_RESETN,
           AXI4_Lite_ACLK,
           AXI4_Lite_ARESETN,
           AXI4_Lite_AWADDR,
           AXI4_Lite_AWVALID,
           AXI4_Lite_WDATA,
           AXI4_Lite_WSTRB,
           AXI4_Lite_WVALID,
           AXI4_Lite_BREADY,
           AXI4_Lite_ARADDR,
           AXI4_Lite_ARVALID,
           AXI4_Lite_RREADY,
           LEDs,
           AXI4_Lite_AWREADY,
           AXI4_Lite_WREADY,
           AXI4_Lite_BRESP,
           AXI4_Lite_BVALID,
           AXI4_Lite_ARREADY,
           AXI4_Lite_RDATA,
           AXI4_Lite_RRESP,
           AXI4_Lite_RVALID);


  input   IPCORE_CLK;  // ufix1
  input   IPCORE_RESETN;  // ufix1
  input   AXI4_Lite_ACLK;  // ufix1
  input   AXI4_Lite_ARESETN;  // ufix1
  input   [15:0] AXI4_Lite_AWADDR;  // ufix16
  input   AXI4_Lite_AWVALID;  // ufix1
  input   [31:0] AXI4_Lite_WDATA;  // ufix32
  input   [3:0] AXI4_Lite_WSTRB;  // ufix4
  input   AXI4_Lite_WVALID;  // ufix1
  input   AXI4_Lite_BREADY;  // ufix1
  input   [15:0] AXI4_Lite_ARADDR;  // ufix16
  input   AXI4_Lite_ARVALID;  // ufix1
  input   AXI4_Lite_RREADY;  // ufix1
  output  [3:0] LEDs;  // ufix4
  output  AXI4_Lite_AWREADY;  // ufix1
  output  AXI4_Lite_WREADY;  // ufix1
  output  [1:0] AXI4_Lite_BRESP;  // ufix2
  output  AXI4_Lite_BVALID;  // ufix1
  output  AXI4_Lite_ARREADY;  // ufix1
  output  [31:0] AXI4_Lite_RDATA;  // ufix32
  output  [1:0] AXI4_Lite_RRESP;  // ufix2
  output  AXI4_Lite_RVALID;  // ufix1


  wire reset;
  wire [31:0] ip_timestamp;  // ufix32
  wire reset_cm;  // ufix1
  wire reset_internal;  // ufix1
  wire reset_before_sync;  // ufix1
  wire [7:0] Read_back_sig;  // ufix8
  wire write_axi_enable;  // ufix1
  wire [3:0] write_Blink_frequency;  // ufix4
  wire write_Blink_direction;  // ufix1
  wire ce_out_sig;  // ufix1
  wire [3:0] LED_sig;  // ufix4


  assign ip_timestamp = 32'b10001001010010000011100011001000;



  assign reset_cm =  ~ IPCORE_RESETN;



  assign reset_before_sync = reset_cm | reset_internal;



  led_count_ip_reset_sync u_led_count_ip_reset_sync_inst (.clk(IPCORE_CLK),  // ufix1
                                                          .reset_in(reset_before_sync),  // ufix1
                                                          .reset_out(reset)
                                                          );

  led_count_ip_axi_lite u_led_count_ip_axi_lite_inst (.reset(reset),
                                                      .AXI4_Lite_ACLK(AXI4_Lite_ACLK),  // ufix1
                                                      .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),  // ufix1
                                                      .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR),  // ufix16
                                                      .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),  // ufix1
                                                      .AXI4_Lite_WDATA(AXI4_Lite_WDATA),  // ufix32
                                                      .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),  // ufix4
                                                      .AXI4_Lite_WVALID(AXI4_Lite_WVALID),  // ufix1
                                                      .AXI4_Lite_BREADY(AXI4_Lite_BREADY),  // ufix1
                                                      .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR),  // ufix16
                                                      .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),  // ufix1
                                                      .AXI4_Lite_RREADY(AXI4_Lite_RREADY),  // ufix1
                                                      .read_ip_timestamp(ip_timestamp),  // ufix32
                                                      .read_Read_back(Read_back_sig),  // ufix8
                                                      .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),  // ufix1
                                                      .AXI4_Lite_WREADY(AXI4_Lite_WREADY),  // ufix1
                                                      .AXI4_Lite_BRESP(AXI4_Lite_BRESP),  // ufix2
                                                      .AXI4_Lite_BVALID(AXI4_Lite_BVALID),  // ufix1
                                                      .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),  // ufix1
                                                      .AXI4_Lite_RDATA(AXI4_Lite_RDATA),  // ufix32
                                                      .AXI4_Lite_RRESP(AXI4_Lite_RRESP),  // ufix2
                                                      .AXI4_Lite_RVALID(AXI4_Lite_RVALID),  // ufix1
                                                      .write_axi_enable(write_axi_enable),  // ufix1
                                                      .write_Blink_frequency(write_Blink_frequency),  // ufix4
                                                      .write_Blink_direction(write_Blink_direction),  // ufix1
                                                      .reset_internal(reset_internal)  // ufix1
                                                      );

  led_count_ip_dut u_led_count_ip_dut_inst (.clk(IPCORE_CLK),  // ufix1
                                            .reset(reset),
                                            .dut_enable(write_axi_enable),  // ufix1
                                            .Blink_frequency(write_Blink_frequency),  // ufix4
                                            .Blink_direction(write_Blink_direction),  // ufix1
                                            .ce_out(ce_out_sig),  // ufix1
                                            .LED(LED_sig),  // ufix4
                                            .Read_back(Read_back_sig)  // ufix8
                                            );

  assign LEDs = LED_sig;

endmodule  // led_count_ip

