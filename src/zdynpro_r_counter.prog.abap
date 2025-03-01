REPORT zdynpro_r_counter.

DATA: gv_counter     TYPE i.
DATA: counter_field  TYPE c LENGTH 3.

CALL SCREEN 100.

MODULE update_screen OUTPUT.
  WRITE gv_counter TO counter_field.
ENDMODULE.

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'INC'.
      gv_counter = gv_counter + 1.
    WHEN 'DEC'.
      gv_counter = gv_counter - 1.
    WHEN 'RESET'.
      gv_counter = 0.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.
