# Project_Template

## Team Name: 
Crypto_Ringmasters

## Team Members:
- Shafat Shahnewaz
- Rumali Siddiqua
  
## Project Title:
 Implementation and Analysis of Ring Oscillator-based PUF on Xilinx PYNQ-Z1 and Intel Altera FPGAs

## Project Description:
This project focuses on the design and implementation of a Physically Unclonable Function (PUF) based on Ring Oscillator (RO) architectures, deployed on two FPGA platforms within the Xilinx PYNQ-Z1 board. PUFs are lightweight hardware security primitives that leverage inherent manufacturing variations in silicon to produce unique and unpredictable device identifiers. These identifiers can be used in secure applications such as cryptographic key generation, device authentication, and tamper detection.

## Key Objectives:
- Design and implement a RO-PUF architecture using Verilog on 3 PYNQ-Z1 boards.

- Analyze and compare entropy, stability, and uniqueness across different platforms.

- Evaluate power, area, and timing efficiency for integration into secure embedded applications.

## Technology Stack:
## Hardware:

- Xilinx PYNQ-Z1

## Software Tools:

- Vivado (for Xilinx FPGA design)

- Jupyter Notebook (PYNQ control via Python)

- ModelSim (simulation)

- Python/NumPy for data analysis

## Languages:

- Verilog (PUF logic)

- Python (data collection and control on PYNQ)

## Expected Outcomes:
- Functional RO-PUF design on both platforms
- Entropy and reliability analysis of PUF responses
- Resource and performance comparison between PYNQ and Intel platforms
- Prototype for secure key generation in embedded devices

## Tasks:

| Task               | Description                                                              | Assigned To       |
|--------------------|---------------------------------------------------------------------------|-------------------|
| Literature Survey  | Review RO-PUF implementations and related security techniques             | Shafat & Rumali   |
| Verilog Design     | Implement RO, controller, comparator, and shift register modules          | Shafat & Rumali   |
| PYNQ Integration   | Develop AXI-Lite interface and Jupyter Notebook interface                 |                   |
| Intel FPGA Port    | Adapt and test the design for Intel FPGA platform                         |                   |
| Testing & Analysis | Measure frequency, entropy, and stability across devices                  |                   |
| Documentation      | Prepare final report and presentation                                     | Both              |


## Timeline:

| Milestone                          | Timeline     |
|-----------------------------------|--------------|
| Literature review and design planning | Week 0       |
| Implementation on PYNQ-Z1         | Week 1        |
| Implementation on Intel FPGA      | Weeks 2–3     |
| Testing and environmental analysis| Weeks 2–3     |
| Data analysis and documentation   | Week 4        |
| Final report and presentation     | Week 4        |

## Workflow of the Project:
