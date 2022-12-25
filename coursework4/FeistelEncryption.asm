@4 //Set Value of counter for the loop
D=A
M=D
@1 //Copy the key into RAM 3
D=M
@3
M=D
@2 // Copy plain text value to RAM 9
D=M
@9
M=D
@10 // Copy plain text value to RAM10
M=D
@255 // Store the mask for R0 in RAM12
D=A
@12
M=D
@12 // Mask the top 8 bits in RAM9
D=M
@10 // AND THE plain text with the mask for r0
M=D&M
D=M
@9 // XOR plaintext in RAM9 and R0 in RAM10
D=M // left side
@13
M=!D
@10
D=M
@13
M=D&M
@10 // right side
D=M
@14
M=!D
@9
D=M
@14
M=D&M
D=M
@13
M=D|M
D=M
@9
M=D
@9 //Copy L0 into RAM13
D=M
@13
M=D
@10 //Copy R0 into ram14
D=M
@14
M=D
@14 // XORing R0 and key
D=M //Copy the value of R0
@15 // Negate it and store it in RAM15
M=!D
@3 // Copy the value of the Key
D=M
@15 // AND the value of key with negated R0
M=D&M
@3 // Copy the value of the key
D=M
@16 //Negate the value of the key and store it in RAM16
M=!D
@14 //Copy the value of R0 from ram 14
D=M
@16 //AND the value of negated key with R0
M=D&M
D=M //Copy the Value of RAM16
@15 // OR Value of RAM15 with RAM16
M=D|M
D=M // Copy value of RAM15 -
@8
D=A
@7
M=D
@9 // Copy 9 to 13 i.e. copy the value of L0 into 13
D=M // Code is working up till here
@13 // *Circular shift values RAM 13 8 times*
M=D
@22 //*****START OF LOOP*******
D=M
@22 //Left shift RAM22
M=D+M
@13// Copy 13 to 21 i.e. copy the value of L0 into 13
D=M
@21
M=D
@32767 // Obtain mask value for l0
D=A
@19 // // Store the mask in RAM19
M=D
M=M+1
@32767 // Obtain the value of the subtractant
D=A
@20 // Store the subtractant in RAM20
M=D
@19
D=M
@21 // Mask all the values except for MSB
M=D&M
@20 // Copy subtractant from RAM20
D=M
@21 // Subtract value to get 1 or <0
M=M-D
@21 // Get the condition for the jump
D=M
@111 // Jump to 111 if data is 0 i.e. don't add 1 *****
D;JLT
@22 // Add 1 to LSB if remainder is 1s
M=M+1
@13 //Left shift RAM13
D=M
M=D+M
@7 // Reduce the counter by 1
M=M-1
D=M
@80 // Repeat the step 7 times; Jump start of loop if greater than 0
D;JGT
@22 // Copy the values in 22 into 13
D=M
@13
M=D
@13 //XOR L0 in 13 and 15 for the second XOR
D=M
@17
M=!D
@15
D=M
@17
M=D&M
@15
D=M
@18
M=!D
@13
D=M
@18
M=D&M
D=M
@17
M=D|M
D=M
@13 // Copy second XOR value into 13 / Save the result of second xor in ram14
M=D
@14 // Move RAM14 all the way to the left i.e. bit shift 8 times
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
D=M
M=D+M
@13 // Concatenate 13 & 14 to get new value
D=M
@14
M=D+M
D=M
@2 //Save new value in RAM2
M=D
@1 //Circular Shifting The Key
D=M
@3
M=D
@128
D=A
@5
M=D
D=M
@3
M=D&M
@127
D=A
@3
M=M-D
@1
D=M
M=D+M
@255
D=A
@1
M=D&M
@3
D=M
@198 //Jump to 198
D;JLT
@1 // Add 1 to new key
M=M+1
D=M
@3 // Jump location - Copy new key to RAM3
M=D
@4 // Update the round
M=M-1
@0 // Reset all the values of intermediary RAM locations
D=A
@3
M=D
@5
M=D
@6
M=D
@7
M=D
@8
M=D
@9
M=D
@10
M=D
@11
M=D
@12
M=D
@13
M=D
@14
M=D
@15
M=D
@16
M=D
@17
M=D
@18
M=D
@19
M=D
@20
M=D
@21
M=D
@22
M=D
@4
D=M
@3
D;JGT
@2
D=M
@0
M=D
@250
0;JMP
