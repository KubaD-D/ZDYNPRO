CLASS zdynpro_cl_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.

    METHODS digit_pressed
      IMPORTING
        iv_digit TYPE i.

    METHODS set_operation_add.

    METHODS set_operation_sub.

    METHODS set_operation_mul.

    METHODS set_operation_div.

    METHODS calculate.

    METHODS get_screen
      RETURNING
        VALUE(rv_screen) TYPE string.

    METHODS reset.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS memorize_screen.

    DATA mv_screen           TYPE string.
    DATA mv_memorized_screen TYPE string.
    DATA mv_operation        TYPE char3.
ENDCLASS.


CLASS zdynpro_cl_calculator IMPLEMENTATION.

  METHOD constructor.
    reset(  ).
  ENDMETHOD.

  METHOD reset.
    mv_screen = '0'.
    mv_memorized_screen = ''.
    mv_operation = lcl_operation=>none.
  ENDMETHOD.

  METHOD get_screen.
    rv_screen = mv_screen.
  ENDMETHOD.

  METHOD digit_pressed.
    IF iv_digit < 0 OR iv_digit > 9.
      RETURN.
    ENDIF.

    IF mv_operation <> lcl_operation=>none.
      mv_screen = ''.
    ENDIF.

    IF mv_screen = '0'.
      mv_screen = '' && iv_digit.
    ELSE.
      mv_screen = mv_screen && iv_digit.
    ENDIF.
  ENDMETHOD.

  METHOD calculate.
    DATA lv_memorized_number TYPE float.
    DATA lv_current_number   TYPE float.
    DATA lv_result           TYPE float.

    lv_memorized_number = mv_memorized_screen.
    lv_current_number = mv_screen.

    CASE mv_operation.
      WHEN lcl_operation=>add.
        lv_result = lv_memorized_number + lv_current_number.
      WHEN lcl_operation=>sub.
        lv_result = lv_memorized_number - lv_current_number.
      WHEN lcl_operation=>mul.
        lv_result = lv_memorized_number * lv_current_number.
      WHEN lcl_operation=>div.
        lv_result = lv_memorized_number / lv_current_number.
    ENDCASE.

    lv_result = ROUND( val = lv_result dec = 10 ).
    mv_screen = lv_result.

    DATA lv_screen TYPE c LENGTH 21.
    WRITE lv_result TO lv_screen DECIMALS 2.

    mv_screen = lv_screen.

    mv_memorized_screen = ''.
  ENDMETHOD.

  METHOD memorize_screen.
    IF mv_memorized_screen IS NOT INITIAL.
      calculate(  ).
    ENDIF.

    mv_memorized_screen = mv_screen.
  ENDMETHOD.

  METHOD set_operation_add.
    mv_operation = lcl_operation=>add.
    memorize_screen(  ).
  ENDMETHOD.

  METHOD set_operation_sub.
    mv_operation = lcl_operation=>sub.
    memorize_screen(  ).
  ENDMETHOD.

  METHOD set_operation_mul.
    mv_operation = lcl_operation=>mul.
    memorize_screen(  ).
  ENDMETHOD.

  METHOD set_operation_div.
    mv_operation = lcl_operation=>div.
    memorize_screen(  ).
  ENDMETHOD.

ENDCLASS.
