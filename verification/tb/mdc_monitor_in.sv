///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_monitor_in
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_monitor_in extends uvm_monitor;

  vif  vif_in;
  event begin_record, end_record;
  mdc_transaction_in  tr_in;
  uvm_analysis_port #(mdc_transaction_in) req_port;
  `uvm_component_utils(mdc_monitor_in)
  int dtx_old = 0;
  int dty_old = 0;
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
    req_port = new("req_port", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(vif)::get(this, "", "vif", vif_in));
    tr_in = mdc_transaction_in::type_id::create("tr_in", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    fork
      collect_transactions(phase);
    join
  endtask

  virtual task collect_transactions(uvm_phase phase);
    wait (vif_in.rstn_i === 0);
    @(posedge vif_in.rstn_i);  
    forever begin
      @(posedge vif_in.clk_i) begin 
        if(!vif_in.busy_o) begin
          @(posedge vif_in.busy_o);
          begin_tr(tr_in, "req");
            tr_in.data_x = vif_in.dtx_i;
            tr_in.data_y = vif_in.dty_i;
            req_port.write(tr_in);
            @(posedge vif_in.clk_i); 
          end_tr(tr_in);
        end
      end
    end
  endtask
endclass: mdc_monitor_in
