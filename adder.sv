module FullAdder (
  input  a, b, cIn,
  output sum, cOut
);
  assign sum = a ^ b ^ cIn;
  assign cOut = (a & b) | (a & cIn) | (b & cIn);
endmodule

