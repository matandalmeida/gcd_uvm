///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_if
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

interface mdc_if(input logic clk_i, rstn_i);

  logic       enb_i;
  logic       busy_o;
  logic [7:0] dtx_i;
  logic [7:0] dty_i;
  logic [7:0] dt_o;

  modport master(
    input   rstn_i,
    input   clk_i,
    input   dt_o,
    input   busy_o,
    output  enb_i,
    output  dtx_i,
    output  dty_i
  );

  modport slave(
    input   rstn_i,
    input   clk_i,
    input   enb_i,
    input   dtx_i,
    input   dty_i,
    output  busy_o,
    output  dt_o
  );
endinterface : mdc_if
