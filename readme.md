# Pong NES

pong that can run on the NES  

## Build and run instructions

1st download CL65 assembler

https://cc65.github.io/doc/cl65.html

next either run the provided bash script or
smply do

```sh
mkdir -p build # this is OS specific. but create a directory called build 
cl65  --target nes ./src/main.s -o ./build/build.nes

```
next download fcuex nes emulator. 
or if you can burn this onto a NES cartridge go ahead

https://fceux.com/web/download.html

load the file

`` ./build/build.nes `` into FCUEX emulator

