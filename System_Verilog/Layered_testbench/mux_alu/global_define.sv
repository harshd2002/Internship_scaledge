//global variables


//enum type variable to select operation type
typedef enum {BIT_AND, SUB, ADD, SQ_A, SQ_B, MASK1_A, MASK0_B, INVALID} operation;

event item_done;
event reset_evt;

bit clk;

parameter RST_DEL = 15;
