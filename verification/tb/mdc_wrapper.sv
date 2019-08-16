///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_wrapper
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

module mdc_wrapper (mdc_if bus);

    mdc mdc_sv (
        .clk_i(bus.clk_i),
        .rstn_i(bus.rstn_i),
        .enb_i(bus.enb_i),
        .dtx_i(bus.dtx_i),
        .dty_i(bus.dty_i),
        .busy_o(bus.busy_o),
        .dt_o(bus.dt_o));

endmodule
