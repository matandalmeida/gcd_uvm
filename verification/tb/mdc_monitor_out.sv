///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_monitor_out
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_monitor_out extends uvm_monitor;

  vif  vif_out;
  event begin_record, end_record;
  mdc_transaction_out tr_out;
  uvm_analysis_port #(mdc_transaction_out) resp_port;
  `uvm_component_utils(mdc_monitor_out)
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
    resp_port = new("resp_port", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(vif)::get(this, "", "vif", vif_out));
    tr_out = mdc_transaction_out::type_id::create("tr_out", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    fork
      collect_transactions(phase);
    join
  endtask

  virtual task collect_transactions(uvm_phase phase);
    wait (vif_out.rstn_i === 0);
    @(posedge vif_out.rstn_i);  
    forever begin
      @(posedge vif_out.clk_i) begin 
        if(vif_out.busy_o) begin
          @(negedge vif_out.busy_o);
          begin_tr(tr_out, "resp");
            tr_out.result = vif_out.dt_o;
            resp_port.write(tr_out);
          end_tr(tr_out);
        end
      end
    end
  endtask
endclass: mdc_monitor_out
