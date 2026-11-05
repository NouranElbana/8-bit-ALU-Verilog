//A module is like creating a black box
//In this case my module has 3 inputs and 1 Output

module alu(
    //Declare 8-bit input A
    input [7:0] A,
    
    //Declare 8-bit input B
    input [7:0] B,

    //Declare 3-bit input opcode
    input [2:0] opcode,

    //reg — A variable that can be assigned inside an initial or always block
    //wire — For connections driven by assign statements or module outputs.

    //Declare 8-bit output Y
    output reg [7:0] Y
);

always @(*) begin   //Runs always when a relevant input changes, usually describes combinational logic and doesn't need a clock
    case(opcode)    //Case checks which option (opcode) to perform

    //Addition when opcode = 000
    3'b000: Y = A + B;

    //Subtraction when opcode = 001
    3'b001: Y = A - B;

    //AND when opcode = 010
    3'b010: Y = A & B;

    //OR when opcode = 011
    3'b011: Y = A | B;

    //XOR when opcode = 100
    3'b100: Y = A ^ B;

    //NOT A when opcode = 101
    3'b101: Y = ~A;

    //Set Y = 0 for unused opcodes
    default: Y = 8'b00000000;

    endcase

end

endmodule
