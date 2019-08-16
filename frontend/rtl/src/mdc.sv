module mdc
(
  input logic        clk_i,
  input logic        rstn_i,
  input logic        enb_i,
  input logic  [7:0] dtx_i,
  input logic  [7:0] dty_i,

  output logic [7:0] dt_o,
  output logic       busy_o
);

  logic              operation;

  mdc_ctrl mc
  (
    .clk_i           (clk_i    ),
    .rstn_i          (rstn_i   ),
    .enb_i           (enb_i    ),
    .operation_i     (operation),

    .busy_o          (busy_o   )
  );

  mdc_proc mp
  ( 
    .clk_i           (clk_i    ),
    .rstn_i          (rstn_i   ),
    .enb_i           (enb_i    ),
    .dtx_i           (dtx_i    ),
    .dty_i           (dty_i    ),
    .busy_i          (busy_o   ),

    .operation_o     (operation),
    .dt_o            (dt_o     )
  );

endmodule