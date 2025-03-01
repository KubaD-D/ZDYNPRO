REPORT zdynpro_r_calculator.

DATA calc_screen TYPE char21.
DATA(go_calculator) = NEW zdynpro_cl_calculator(  ).


CALL SCREEN 100.

MODULE refresh_0100 OUTPUT.
  calc_screen = go_calculator->get_screen(  ).
ENDMODULE.

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BTN0'.
      go_calculator->digit_pressed( 0 ).
    WHEN 'BTN1'.
      go_calculator->digit_pressed( 1 ).
    WHEN 'BTN2'.
      go_calculator->digit_pressed( 2 ).
    WHEN 'BTN3'.
      go_calculator->digit_pressed( 3 ).
    WHEN 'BTN4'.
      go_calculator->digit_pressed( 4 ).
    WHEN 'BTN5'.
      go_calculator->digit_pressed( 5 ).
    WHEN 'BTN6'.
      go_calculator->digit_pressed( 6 ).
    WHEN 'BTN7'.
      go_calculator->digit_pressed( 7 ).
    WHEN 'BTN8'.
      go_calculator->digit_pressed( 8 ).
    WHEN 'BTN9'.
      go_calculator->digit_pressed( 9 ).
    WHEN 'BTNADD'.
      go_calculator->set_operation_add(  ).
    WHEN 'BTNSUB'.
      go_calculator->set_operation_sub(  ).
    WHEN 'BTNMUL'.
      go_calculator->set_operation_mul(  ).
    WHEN 'BTNDIV'.
      go_calculator->set_operation_div(  ).
    WHEN 'BTNEQ'.
      go_calculator->calculate(  ).
    WHEN 'BTNC'.
      go_calculator->reset(  ).
    WHEN 'BTNCE'.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.
