///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_transaction_out
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_transaction_out extends uvm_sequence_item;
  rand bit [7:0] result;
  //Alterar os dados para sua aplicação
  function new(string name = "");
    super.new(name);
  endfunction: new

  `uvm_object_utils_begin(mdc_transaction_out)
    `uvm_field_int(result, UVM_ALL_ON|UVM_UNSIGNED)
  `uvm_object_utils_end

  function string convert2string();
    return $sformatf("{result = %d}", result);
  endfunction
endclass: mdc_transaction_out
