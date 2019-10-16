///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_driver_out
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_driver_out extends uvm_driver #(mdc_transaction_out);
  `uvm_component_utils(mdc_driver_out)

  vif vif_out;
  mdc_transaction_out tr_out;
  bit item_done;

  function new(string name = "mdc_driver_out", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(vif)::get(this, "", "vif", vif_out));
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif_out.clk_i) begin
      	// Coloque a logica caso necessario
      end
    end
  endtask
 endclass: mdc_driver_out
