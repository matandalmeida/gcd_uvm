///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_angent_in
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_agent_in extends uvm_agent;

    typedef uvm_sequencer#(mdc_transaction_in) mdc_sequencer;
    mdc_sequencer   sqr;
    mdc_driver_in    drv_in;
    mdc_monitor_in  mon_in;

    uvm_analysis_port #(mdc_transaction_in) agt_req_port;

    `uvm_component_utils(mdc_agent_in)

    function new(string name = "mdc_agent_in", uvm_component parent = null);
        super.new(name, parent);
        agt_req_port = new("agt_req_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_in = mdc_monitor_in::type_id::create("mon_in", this);
        sqr = mdc_sequencer::type_id::create("sqr", this);
        drv_in = mdc_driver_in::type_id::create("drv_in", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mon_in.req_port.connect(agt_req_port);
        drv_in.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass: mdc_agent_in
