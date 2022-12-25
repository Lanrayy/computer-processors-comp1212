load FeistelEncryption.asm,
output-file cw4q2cycles.out,
output-list time%D2.6.2;

set PC 0,
set RAM[0] 0,
set RAM[1] 255,
set RAM[2] -1;

while RAM[0] = 0 {
    ticktock;
}

output;