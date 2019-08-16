///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_transaction_in
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_transaction_in extends uvm_sequence_item;
  rand bit [7:0] data_x;
  rand bit [7:0] data_y;
  rand bit       enb;
  //Alterar os dados para sua aplicação
  function new(string name = "");
    super.new(name);
  endfunction: new

  `uvm_object_utils_begin(mdc_transaction_in)
    `uvm_field_int(data_x, UVM_ALL_ON|UVM_UNSIGNED)
    `uvm_field_int(data_y, UVM_ALL_ON|UVM_UNSIGNED)
    `uvm_field_int(enb, UVM_ALL_ON|UVM_UNSIGNED)
  `uvm_object_utils_end

  function string convert2string();
      return $sformatf("{data_x = %d, data_y = %d, enb = %d}", data_x, data_y, enb);
  endfunction
endclass: mdc_transaction_in
