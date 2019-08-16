///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: simple_test
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class simple_test extends uvm_test;
  mdc_env env_h;
  mdc_sequence seq;

  `uvm_component_utils(simple_test)

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = mdc_env::type_id::create("env_h", this);
    seq = mdc_sequence::type_id::create("seq", this);
  endfunction

  task run_phase(uvm_phase phase);
    seq.start(env_h.mst_in.sqr);
  endtask: run_phase

endclass: simple_test
