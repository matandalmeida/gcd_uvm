///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_refmod
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

import "DPI-C" context function int my_mdc(int x, int y);

class mdc_refmod extends uvm_component;
  `uvm_component_utils(mdc_refmod)
  
  mdc_transaction_in tr_in;
  mdc_transaction_out tr_out;

  uvm_analysis_imp #(mdc_transaction_in, mdc_refmod) in;
  uvm_analysis_port #(mdc_transaction_out) out;

  int gcd = 1;

  event begin_refmodtask;
    
  function new(string name = "mdc_refmod", uvm_component parent);
    super.new(name, parent);
    in = new("in", this);
    out = new("out", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction: build_phase
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      @begin_refmodtask;
      tr_out = mdc_transaction_out::type_id::create("tr_out", this);
      begin_tr(tr_out, "ref_out)");
      gcd = my_mdc(tr_in.data_x, tr_in.data_y);
      tr_out.result = gcd;
      out.write(tr_out);
    end
  endtask: run_phase

  virtual function write (mdc_transaction_in t);
    end_tr(tr_out);
    tr_in = mdc_transaction_in#()::type_id::create("tr_in", this);
    begin_tr(tr_in, "ref_in");
    tr_in.copy(t);
    -> begin_refmodtask;
    end_tr(tr_in);
  endfunction
endclass: mdc_refmod
