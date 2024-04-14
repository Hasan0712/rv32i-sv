module fetch #(
    parameter DataWidth = 32;
    )(
        input logic clk,
        input logic rst,
        input logic load,
        input logic jalr,
        input logic valid,
        input logic next_sel,
        input logic branch_reselt,
        input logic [DataWidth-1 : 0] next_address,
        input logic [DataWidth-1 : 0] address_in,
        input logic [DataWidth-1 : 0] instruction_fetch,

        output logic we_re,
        output logic request,
        output logic [3:0] mask,
        output logic [DataWidth-1 : 0] pc_address,
        output logic [DataWidth-1 : 0] instruction,
        output logic [DataWidth-1 : 0] pre_address_pc
        );

    // PROGRAM COUNTER
    program_counter u_programcounter 
    (
        .clk(clk),
        .rst(rst),
        .load(load),
        .jalr(jalr),
        .dmem_valid(valid),
        .next_sel(next_sel),
        .next_address(next_address),
        .branch_reselt(branch_reselt),
        .address_in(0),
        .address_out(pc_address),
        .pre_address_pc(pre_address_pc)
    );

    always_comb begin

        instruction = instruction_fetch ;
    end
endmodule