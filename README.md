# Pong NES

pong that can run on the NES  

## Build Instrcutions

you need to download CL65 assembler

https://cc65.github.io/doc/cl65.html

once thats downloaded. add it to your PATH if needed

now you can either run the bash script 

or if your OS doesnt support bash then run this command exactly

```sh
mkdir -p build # this is OS specific. but create a directory called build 
cl65  --target nes ./src/main.s -o ./build/build.nes

```

## how to run

assuming you dont have a NES on hand. your going to need an emulator

i reccomend the FCUEX emulator

download it here

https://fceux.com/web/download.html

and load the file

`` ./build/build.nes `` into FCUEX emulator

