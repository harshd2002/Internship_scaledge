//global variables


//enum type variable to select operation type
typedef enum bit [3:0] {BIT_AND, SUB, ADD, SQ_A, SQ_B, MASK1_A, MASK0_B, INVALID} operation;

//events for reset (reset_evt) and handshaking between generator and monitor (item_done)
event item_done;
event reset_evt;

//clock declaration
bit clk;

//delay for deasserting reset
byte RST_DEL = 15;
byte TIME_OUT = 20;

//variables for number of transactions
byte unsigned trans_num = 5;
