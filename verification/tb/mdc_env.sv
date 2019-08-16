///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_env
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_env extends uvm_env;

  mdc_agent_in    mst_in;
  mdc_agent_out   mst_out;
  mdc_scoreboard  sb;
  mdc_cover       sub;

  `uvm_component_utils(mdc_env)

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mst_in = mdc_agent_in::type_id::create("mst_in", this);
    mst_out = mdc_agent_out::type_id::create("mst_out", this);
    sb = mdc_scoreboard::type_id::create("sb", this);
    sub = mdc_cover::type_id::create("sub",this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mst_in.agt_req_port.connect(sub.req_port);
    mst_out.agt_resp_port.connect(sub.resp_port);
    mst_in.agt_req_port.connect(sb.ap_rfm);
    mst_out.agt_resp_port.connect(sb.ap_comp);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
  endfunction

endclass: mdc_env
