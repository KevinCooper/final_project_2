# Final Project #
C2C Kevin Cooper
## Abstract ##
Large amount of network traffic can significantly slow down border machines on networks.  Reducing the amount of illegitimate traffic reduces load on computer running software solutions, allowing them to focus on more complicated tasks of intrusion detection and correlation.  Larger data bus would allow for simultaneous packets to be analyzed at once, since TCP will take care of reordering the packets when they get to the machine.  Due to the limited ethernet ports, UART will be used in order to verify packet matching/throughput.
## Grade Levels ##
 - Required Functionality: Determine number of packets passing through and output to the UART
 - B - Frame buffer that is able to hold intermediate packets
 - A - Match a packet to an NIDS rule
 
## Plans ##
VHDL
 - FIFO buffers to hold incoming packets to and from the NIDS logic
 - Binary tree for string searching
 - Alternatively, chained AND logic with output's feeding to a positive match
 - State machine to push whole packet through matching logic, push the packet out if no match or drop it if a positive match is found

## Timeline ##
 - Ethernet - 2 Lessons
 - Frame Buffer - 1 Lesson
 - Simple Matching - 1 Lesson

I believe that getting the Xilinx Ethernet CORE ethernet output will be the most difficult to integrate into the VHDL and get working in a fully controllable manner. If it is possible to get a FPGA with two ethernet ports, then the output of the IDS FIFO could just be hooked up in the same manner the input Ethernet is attached to the FIFO 
######References
http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4020922 

http://www.icsi.berkeley.edu/pubs/networking/fpga-shunt-submit.pdf

Network Intrusion Detection Systems on FPGAs with On-Chip Network Interfaces PPT – Craig Ulmer

######Documentation: None