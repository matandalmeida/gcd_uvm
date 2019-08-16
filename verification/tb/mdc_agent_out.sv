///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_angent_out
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_agent_out extends uvm_agent;

    mdc_driver_out  drv_out;
    mdc_monitor_out mon_out;

    uvm_analysis_port #(mdc_transaction_out) agt_resp_port;

    `uvm_component_utils(mdc_agent_out)

    function new(string name = "mdc_agent_out", uvm_component parent = null);
        super.new(name, parent);
        agt_resp_port = new("agt_resp_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_out = mdc_monitor_out::type_id::create("mon_out", this);
        drv_out = mdc_driver_out::type_id::create("drv_out", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mon_out.resp_port.connect(agt_resp_port);
    endfunction
endclass: mdc_agent_out
