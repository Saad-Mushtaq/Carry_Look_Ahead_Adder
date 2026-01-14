module CLA #(
    parameter width = 8
) (
    input   [width-1:0] a, b,
    output  [width:0] sum
);
// Implement the carry look-ahead adder here

logic [width-1:0] g, p;
logic [width-1:0] carry;

assign sum[width] = carry[width-1];

generate
    for(genvar i=0; i<width; i++) begin
        if(i == 0) begin
            FACLA facla_inst (
                .a  (a[i]),
                .b  (b[i]),
                .cIn(1'b0),
                .sum(sum[i]),
                .g  (g[i]),
                .p  (p[i])
            );
        end
        else begin
            FACLA facla_inst (
                .a  (a[i]),
                .b  (b[i]),
                .cIn(carry[i-1]),
                .sum(sum[i]),
                .g  (g[i]),
                .p  (p[i])
            );
        end
    end
endgenerate

CLAG carry_look_ahead(
    .g   (g), 
    .p   (p),
    .cIn (1'b0),
    .cOut(carry)
);
endmodule