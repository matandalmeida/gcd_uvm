///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_driver_in
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

typedef virtual mdc_if.master vif;

class mdc_driver_in extends uvm_driver #(mdc_transaction_in);
  `uvm_component_utils(mdc_driver_in)

  vif vif_in;
  mdc_transaction_in tr_in;
  bit item_done;
  event begin_record,end_record;

  function new(string name = "mdc_driver_in", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(vif)::get(this, "", "vif", vif_in)) begin
      `uvm_fatal("NOVIF", "failed to get virtual interface")
    end
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif_in.clk_i) begin
        item_done = 0;
        if(!vif_in.rstn_i) begin
          vif_in.enb_i = 0;
          vif_in.dtx_i = 0;
          vif_in.dty_i = 0;
          item_done = 0;
        end
        else begin
          if(tr_in) begin
            if(!vif_in.busy_o) begin
              @(posedge vif_in.clk_i); 
              vif_in.enb_i = 1;
              vif_in.dtx_i = tr_in.data_x;
              vif_in.dty_i = tr_in.data_y;
              item_done = 1;
              @(posedge vif_in.clk_i); 
            end 
          end
          if (item_done) begin
            `uvm_info("ITEM_DONE", $sformatf("Item done."), UVM_HIGH);
            seq_item_port.item_done();
          end
          if ((item_done || !tr_in) && vif_in.rstn_i) begin
            seq_item_port.try_next_item(tr_in);
          end
        end
      end
    end
  endtask
 endclass: mdc_driver_in
