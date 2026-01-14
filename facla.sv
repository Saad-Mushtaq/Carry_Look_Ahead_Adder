module FACLA (
  input   a, b, cIn,
  output  sum, g, p
);
  // Define your modified Full-Adder for the carry-look ahead here
  
  assign sum = a ^ b ^ cIn;
  assign g = a & b;
  assign p = a ^ b;

endmodule
