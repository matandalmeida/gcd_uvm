///////////////////////////////////////////////////////////////////////////////////////////////////
//
//        CLASS: mdc_sequence
//  DESCRIPTION: 
//         BUGS: ---
//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
//      VERSION: 1.0
//      CREATED: 08/14/2019 02:05:25 PM
//     REVISION: ---
///////////////////////////////////////////////////////////////////////////////////////////////////

class mdc_sequence extends uvm_sequence #(mdc_transaction_in);    
  `uvm_object_utils(mdc_sequence)

  function new(string name="mdc_sequence");
    super.new(name);
  endfunction: new

  task body;
    mdc_transaction_in tr;

    forever begin
      tr = mdc_transaction_in::type_id::create("tr");
      start_item(tr);
      assert(tr.randomize());
      finish_item(tr);
    end
  endtask: body
endclass: mdc_sequence
