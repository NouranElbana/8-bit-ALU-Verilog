# 8-Bit Arithmetic Logic Unit (ALU) — Verilog

## Project Overview
Designed and implemented an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL, supporting six arithmetic and bitwise operations.
The project covers RTL design, functional verification, waveform analysis and ASIC physical implementation using Vulkos, LibreLane and the SKY130 PDK.

## Supported Operations
| Opcode | Operation | Description |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A − B |
| 010 | AND | A & B |
| 011 | OR | A \| B |
| 100 | XOR | A ^ B |
| 101 | NOT | ~A |
| 110–111 | Default | Output zero |

The ALU uses two 8-bit inputs (`A`, `B`), a 3-bit opcode and an 8-bit output (`Y`).

## Functional Verification
Developed a self-checking Verilog testbench to verify the ALU's functionality.
- Tested all six supported operations using combinations of input values.
- Included boundary tests for 8-bit arithmetic overflow and underflow.
- Executed 98 test cases, with 98 passing and 0 failing.
- Generated VCD waveforms to examine input and output behaviour.

The tests provide functional coverage of selected inputs and edge cases but are not exhaustive across all possible 8-bit input combinations.

## ASIC Implementation
Implemented the ALU using the LibreLane RTL-to-GDSII flow through Vulkos, targeting the SKY130 PDK.
The implementation involved logic synthesis, floorplanning, placement, routing and physical verification.

### Preliminary Implementation Results
| Metric | Result |
|---|---|
| Standard-cell count | 341 |
| Standard-cell area | 1,371.32 µm² |
| Core utilisation | 8.31% |
| Worst setup slack | +5.19 ns |
| DRC violations | 0 |
| LVS errors | 0 |

Power estimates depend on analysis conditions and are being reviewed separately.
The positive timing slack indicates that the analysed paths meet their configured timing constraints; it does not directly represent the ALU's propagation delay.

## Tools and Technologies
- **Verilog HDL:** RTL design and testbench development
- **Vulkos:** Web-based development and analysis environment
- **Verilator:** Functional simulation
- **Surfer:** Waveform inspection
- **LibreLane:** ASIC physical implementation flow
- **SKY130 PDK:** Semiconductor process information and standard-cell libraries

## Repository Structure
```text
src/          ALU RTL design
tb/           Self-checking testbench
config.json   LibreLane configuration
```

## Future Development
This ALU will serve as a building block for a custom 8-bit CPU, incorporating registers, a program counter, instruction decoding, control logic and memory.
