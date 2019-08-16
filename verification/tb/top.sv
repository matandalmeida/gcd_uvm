///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: top
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

module top;
    import uvm_pkg::*;
    import mdc_pkg::*;
    logic clk;
    logic reset;
    parameter min_cover = 70;
    parameter min_transa = 5000;

    initial begin
      clk = 1;
      reset = 1;
      #20 reset = 0;
      #20 reset = 1;
    end

    always #10 clk = !clk;

    mdc_if dut_if(.clk_i(clk), .rstn_i(reset));

    mdc_wrapper dut(.bus(dut_if));

    initial begin
      `ifdef XCELIUM
         $recordvars();
      `endif
      `ifdef VCS
         $vcdpluson;
      `endif
      `ifdef QUESTA
         $wlfdumpvars();
         set_config_int("*", "recording_detail", 1);
      `endif
    end

    initial begin
      uvm_config_db#(vif_mst)::set(uvm_root::get(), "*", "vif_in", dut_if);
      uvm_config_db#(vif_slv)::set(uvm_root::get(), "*", "vif_out", dut_if);
      uvm_config_db#(int)::set(uvm_root::get(),"*", "min_cover", min_cover);
      uvm_config_db#(int)::set(uvm_root::get(),"*", "min_transa", min_transa);

      run_test("simple_test");
    end
endmodule
