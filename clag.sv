module CLAG #(
    parameter width = 8
) (
    input   [width-1:0] g, p,
    input               cIn,
    output  [width-1:0] cOut
);
    // Define the carry look-ahead generator here that generates the carries depending on the carry generate and carry propagate signal g and p

    logic [width:0] carry;
    assign carry[0] = cIn;

generate
    for (genvar i=1; i <= width; i=i+1) begin
        wire [i-1:0] term;
        for (genvar j=0; j < i; j=j+1) begin
            wire [i-j-2:0] p_chain;
            if (j<i-1) begin
                for (genvar k = j+1; k < i; k = k + 1) begin
                    assign p_chain[k-(j+1)] = p[k];
                end
                assign term[j] = g[j] & (&p_chain);
            end
            else begin
                assign term[j] = g[j];
            end
        end
        assign carry[i] = (|term) | (&p[0 +: i] & carry[0]);
    end
endgenerate
assign cOut = carry[width:1];
endmodule