module mdc_ctrl
(
  input  logic       clk_i,
  input  logic       rstn_i,
  input  logic       enb_i,
  input  logic       operation_i,

  output logic       busy_o
);

  enum
  {
    RESET,
    IDLE,
    OPERATION
  } state, next_state;

  always_ff @(posedge clk_i, negedge rstn_i)
  begin
    if (!rstn_i)
    begin
      state <= RESET;
    end
    else
    begin
      if (enb_i)
      begin
        state  <= next_state;
      end
      else
      begin
        state  <= state;
      end
    end
  end

  always_comb
  begin
    case (state)
      RESET:
      begin
        next_state = IDLE;
      end

      IDLE:
      begin
        next_state = OPERATION;
      end

      OPERATION:
      begin
        if (operation_i == 1'b1)
        begin
          next_state = OPERATION;
        end
        else
        begin
          next_state = IDLE;
        end
      end

      default:
      begin
        next_state = IDLE;
      end
    endcase
  end

  assign busy_o  = (state == OPERATION);

endmodule