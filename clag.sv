module CLAG #(
    parameter width = 8
) (
    input   [width-1:0] g, p,
    input               cIn,
    output  [width-1:0] cOut
);
    // Define the carry look-ahead generator here that generates the carries depending on the carry generate and carry propagate signal g and p

    generate
        for (genvar i=0; i<width; i++) begin
            if(i == 0)begin
                assign cOut[i] = g[i] | p[i] & cIn;
            end
            else begin
                assign cOut[i] = g[i] | p[i] & cOut[i-1];
            end
        end
    endgenerate
endmodule