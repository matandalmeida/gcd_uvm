///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_pkg
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

package mdc_pkg;
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "./mdc_types.svh"
  `include "./mdc_transaction_in.sv"
  `include "./mdc_transaction_out.sv"
  
  
  `include "./mdc_sequence.sv"
  `include "./mdc_driver_in.sv"
  `include "./mdc_monitor_in.sv"
  `include "./mdc_agent_in.sv"
  
  `include "./mdc_driver_out.sv"
  `include "./mdc_monitor_out.sv"
  `include "./mdc_agent_out.sv"

  `include "./mdc_refmod.sv"
  `include "./mdc_cover.sv"
  `include "./mdc_scoreboard.sv"
  `include "./mdc_env.sv"

  `include "./simple_test.sv"
endpackage
