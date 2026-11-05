module alu_tb;

    // ALU inputs as reg because they are used inside the initial block
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;

    // Actual ALU output
    wire [7:0] Y;

    // Expected output
    reg [7:0] expected;

    // Connect the ALU
    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .Y(Y)       //Connect the output port Y of my ALU to the signal Y in my testbench
    );

    // Loop counters
    integer i;  //Changes the Input Values of A
    integer j;  //Changes the Input Values of B
    integer k;  //Changes the Values of opcode

    // Test counters
    integer passed;
    integer failed;

    initial begin

        // Generate waveforms
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        passed = 0;
        failed = 0;

        // Test all six operations
        for (k = 0; k < 6; k = k + 1) begin
            for (i = 0; i < 4; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin

                    A = i;
                    B = j;
                    opcode = k;

                    // Calculate expected output
                    case (opcode)
                        3'b000: expected = A + B;
                        3'b001: expected = A - B;
                        3'b010: expected = A & B;
                        3'b011: expected = A | B;
                        3'b100: expected = A ^ B;
                        3'b101: expected = ~A;
                        default: expected = 8'd0;
                    endcase

                    #10; //Makes the simulator wait for 10ns to allow the ALU to update in simulation 
                        //Then the testbench checks if Y is correct or not

                    // Check the result to see if my Y from my ALU = to the expected from my testbench
                    if (Y === expected) begin
                        passed = passed + 1;
                    end
                    else begin
                        failed = failed + 1;
                    end

                end
            end
        end

        // Boundary Test 1: 255 + 1 = 0 // because of overflow
        A = 8'd255;
        B = 8'd1;
        opcode = 3'b000;
        expected = 8'd0;

        #10;    

        if (Y === expected) begin
            passed = passed + 1;
        end
        else begin
            failed = failed + 1;
        end

        // Boundary Test 2: 0 - 1 = 255
        A = 8'd0;
        B = 8'd1;
        opcode = 3'b001;
        expected = 8'd255;

        #10;

        if (Y === expected) begin
            passed = passed + 1;
        end
        else begin
            failed = failed + 1;
        end

        // Final verification summary
        $display("===== ALU VERIFICATION SUMMARY =====");
        $display("Total tests: %0d", passed + failed);
        $display("Passed: %0d", passed);
        $display("Failed: %0d", failed);
        $display("====================================");

        $finish;
    end

endmodule
