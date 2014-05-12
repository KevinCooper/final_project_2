# ECE 383 Final Project #
## Table of Contents ##
- [Introduction](#introduction)
- [Approach](#approach)
- [Implementation](#implementation)
    - [Diagrams](#diagrams)
        - [Graphical Design Diagram](#graphical-design-diagram)
        - [Project Report](#project-report)
        - [Pattern Matcher Diagram](#pattern-matcher-diagram)
        - [C Call Diagram](#c-call-diagram)
    - [Ethernet](#ethernet)
    - [Pattern Matching](#pattern-matching)
    - [Working Together](#working-together)
    - [Theoretical performance](#theoretical-performance)
- [Testing and Debugging](#testing-and-debugging)
    - [Microblaze Ethernet](#microblaze-ethernet)
    - [Pattern Matching Hardware](#pattern-matching-hardware)
    - [Pattern Matching Ethernet](#pattern-matching-ethernet)
- [Conclusion](#conclusion)
- [Documentation](#documentation)

## Introduction ##

[Lab Link](http://ece383.com/labs/lab5/)

The purpose of this project was to propose our own project.  This included a sign-off schedule, design, build and testing of my proposed design.  In addition to technical work, a final presentation, report and video must be included in the project to demonstrate understanding.  The project was graded off the following criteria:

 1. Complexity of hardware and software design
 2. Quality of documentation, final report, and presentation
 3. Amount of effort demonstrated
 4. Functionality of project based off proposed requirements

The meet the aforementioned requirements, I proposed an interesting, but not entirely novel, idea of implementing hardware level pattern matching for Ethernet packets.  There were three proposed levels of functionality for the project given by:

 1. Required Functionality - Determine number of packets passing through Ethernet and output to UART
 2. B - Frame buffer to hold intermediate packets
 3. A - Match a packet to a sample NIDS rule

During the implementation of the project, it was determined that the B functionality could be accomplished using a much simpler FIFO instead of a homegrown solution for intermediate data storage.

## Approach ##
As given in the levels of functionality, Ethernet needed to be implemented in order for anything further to be accomplished for this project.  After several attempts to implement a simple IP stack using the Ethernet Lite module provided by Xilinx CORE, the design was made to use the provided Microblaze implementation of Ethernet.

Once the problem of how Ethernet was going to be received, the contents of the packets needed to be displayed to the serial connection of the computer to verify that results matched their expected outputs.  The best way to achieve this was using the UART implementation from a previous lab.

The last step was determining how to get the received data from the Microblaze processor to my custom peripheral that did the pattern matching.  Once that was achieved, getting a signal back from the module was necessary in order to visually determine over the serial connection whether a bad packet had been detected.

## Implementation ##

### Diagrams ###

#### Graphical Design Diagram ####

<p align="center">
  <img src="images/diagram.PNG" />
</p>

#### Project Report ####

[Interactive EDK Design Report](https://rawgit.com/KevinCooper/final_project_2/master/images/report/system.html)

### Pattern Matcher Diagram ###

<p align="center">
  <img src="images/pattern.PNG" />
</p>

### C Call Diagram ###

<p align="center">
  <img src="images/call_main.PNG" align="center" />
</p>

### Ethernet ###
Attempting to get Ethernet to work purely in VHDL, which would have simplified design greatly later on, proved to be difficult in the constrained amount of time for this project.  Microblaze was used in order to use the Xilinx peripheral and provided C code to receive packets over the network. Included libraries greatly sped up C code development.
### Pattern Matching ###
The pattern matching followed a simple and easily extendable approach to identifying packets.  Information is streamed into the the module one byte at a time.  As the data moves through the stream buffer, those bytes are compared in order to another module which contains the byte sequence logic to detect a bad pattern.  If any of the detection modules returns true, the pattern matcher is able to determine a positive match has been found. An example of the sequence detection:
```vhdl
/* The following returns true when "bad" is detected in a sequence of data */
match <= '1' when word_one=x"62" and word_two=x"61" and word_three=x"64"
             else '0';
```
The simplified matching logic allows for easy conversion of regular NIDS rules to a rule like the one above.
### Working Together ###
Since the pattern matcher needed to be implemented as a custom peripheral in microblaze, getting the correct clock rate became a significant issue.  Since matching module would normally be implemented with a direct connection to hardware Ethernet connection, speed beacme a small issue part of the pattern matcher if it was modified to work with  Microblaze.  To synchronize the two, the pattern matcher only incremented the input stream whenever the alt input was different than before.  With this in place, the C code could control the speed of the bytes being put into the stream, preventing double byte inputs or spaces between byte inputs.  An example of the C code controlling the byte input:
```C
for (i = 0; i < p->len; i++){
    send = *((char *) p->payload + i) + alt;
    Xil_Out32(0x75E00000, send);
    if (alt == 0x00010000){
        alt = 0;
    else{
        alt = 0x00010000;
    }
}
```

### Theoretical Performance ###

The theoretical speed which the pattern recognition circuit is capable of running at is 8 bits at 100MHz.  At this speed, the pattern recognition circuit could process at speeds of .8gbps. Including additional rulesets would not affect performance due to the parallel nature that the rule circuits are attached to the streaming data.  By attaching another set of rules to streaming data, but offset by one, two or three... The bandwidth of the device would theoretically double, triple, or quadruple respectively.

The above is dependent upon the input and output speeds of the Ethernet ports and their instantiation in a purely hardware manner without a processor managing the incoming packets.

## Testing and Debugging ##

### Microblaze Ethernet ###
Once the Ethernet module was successfully implemented, it became necessary to determine what information I could get when a packet arrived.  By hand, I was able to successfully print out any layer2 or higher IP information from the packet.  This was testing by sending the packet contents over UART to a serial output.  An example of the code that allowed this is:

```C
xil_printf("Received packet. Size: %d. Contents:\r\n");
for( i = 0; i < p->len ; i++) {
    XUartLite_SendByte(0x40600000, *((char *) p->payload + i));
}
```

### Pattern Matching Hardware ###
There was relatively little debugging for the pattern matching hardware.  For the FIFO used, a sample test file was provided with it, reducing the need to implement custom test cases for that module.  After implementing the file, a simple test case with each of the possible positive matches was implemented.  Sample input from the test file:

```vhdl
test <= x"62" --b
alt <= not alt
wait for clk_period;
test <= x"61" --a
alt <= not alt
wait for clk_period;

```

### Pattern Matching Ethernet ####
With the hardware to be confirmed working, it became necessary to prove that the whole chain of components worked as expected.  When first hooking up the module in Microblaze, this was accomplished by using a Serial connection and a telnet connection to the board.  The telnet connection, like before, allowed for data to be sent just by typing into the keyboard.  The serial connection showed the Microblaze output and confirmed that the pattern matching was working as expected.

While testing a few limited cases by hand is useful, a large, varied tests needed to be administered to ensure that the program performed correctly under multiple circumstances.  At this point, a python script was developed to connect both over ethernet and serial connection in order to send random and preconfigured data in particular test cases.  By matching test cases with expected output, the number of tests with different data can be easily be expanded to any number.  

[Python Test Script](projectTester.py)

## Conclusion ##
Out of the sixty cases performed by the test script, mainly due to time constraints, the pattern matching program was able to successfully classify all sixty packets.  The large amount of tests and test types confirms that the program is able to correctly match given patterns without error.

A youtube video showcasing the project can be found at [incredible video](http://youtu.be/zY6FwQDEoMc)

## Documentation ##
The FIFO used to stream in the pattern matcher was pulled from a design off the internet.  The link is in the appropriate file.

C2C William Parks found a bug where I was using Uart input instead of Xil_In to read data from the pattern matcher

C2C Jonathan Remiasz helped with a few grammatical that popped up from late night writing 
