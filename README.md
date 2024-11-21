# Pong NES

[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)

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
the final rom file is

``./build/build.nes``


## Run Instructions

assuming you dont have a NES on hand. your going to need an emulator

I recomend the FCUEX emulator

download it here

https://fceux.com/web/download.html


## Controls

D-pad-up: moves either paddle 1 or paddle 2 up

D-Pad-Down: moves either paddle 1 or paddle 2 down

select: in game play state it pauses the game

start: in main menu state it either starts the game or 
