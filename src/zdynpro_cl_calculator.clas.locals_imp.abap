*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_operation DEFINITION FINAL.
  PUBLIC SECTION.
    CONSTANTS: none TYPE char3 VALUE '',
               add  TYPE char3 VALUE 'ADD',
               sub  TYPE char3 VALUE 'SUB',
               mul  TYPE char3 VALUE 'MUL',
               div  TYPE char3 VALUE 'DIV'.
ENDCLASS.
