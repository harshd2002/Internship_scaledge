module minterm(input a, b, c, d,
								output func_min
								);

			assign func_min = ((~c & ~d) | (~a & b & ~c) | (a & ~b & ~d));

endmodule
