module mdc_proc
(
  input logic        clk_i,
  input logic        rstn_i,
  input logic        enb_i,
  input logic [7:0]  dtx_i,
  input logic [7:0]  dty_i,
  input logic        busy_i,

  output logic       operation_o,
  output logic [7:0] dt_o
);

  logic [15:0] xy;
  logic [15:0] next_xy;

  logic [7:0]  next_dt_o;

  always_ff @(posedge clk_i, negedge rstn_i)
  begin
    if (!rstn_i)
    begin
      xy   <= 16'd0;

      dt_o <= 8'd0;
    end
    else
    begin
      xy   <= xy;

      dt_o <= dt_o;

      if (enb_i)
      begin
        xy   <= next_xy;

        dt_o <= next_dt_o;
      end
    end
  end

  always_comb
  begin
    operation_o = 1'b0;

    next_xy     = xy;

    next_dt_o   = dt_o;

    if (busy_i)
    begin
      if ((!next_xy[15:8]) || (!next_xy[7:0]))
      begin
        if (next_xy[15:8] > next_xy[7:0])
        begin
          next_dt_o = next_xy[15:8];
        end
        else
        begin
          next_dt_o = next_xy[7:0];
        end
      end
      else if (next_xy[15:8] > next_xy[7:0])
      begin
        operation_o = 1'b1;

        next_xy = {(xy[15:8] - xy[7:0]), xy[7:0]};
      end
      else if (next_xy[15:8] < next_xy[7:0])
      begin
        operation_o = 1'b1;

        next_xy = {xy[15:8], (xy[7:0] - xy[15:8])};
      end
      else
      begin
        next_dt_o = next_xy[15:8];
      end
    end
    else
    begin
      if (enb_i)
      begin
        next_xy = {dtx_i, dty_i};
      end
    end
  end

endmodule