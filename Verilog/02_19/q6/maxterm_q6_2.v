module maxterm(input a, b, c, d,
								output func_max
								);

			assign func_max = ((c | d) & (~b | c) & (~a | b | d));

endmodule
