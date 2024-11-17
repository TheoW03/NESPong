## Inspiration

it all started the Fall semester 2023

at my university in operating systems. we finished the class a week earlier than emticipated so the professor descided to lecture us on

Computer architecture due to 95% of the class having a bad expirence with computer architecture. due to having a horrible professor.

anyway I enjoyed this professors lecture very much. so much I descided to ask him for his computer architecture assignmnets. I heard from others they have you build an Emulator for a generic architecture. I finished their assignments in about a month and during this time I was reading up on how todo a NES emulator.

it seemed pretty simple compared to most 
console emulators since it used a small instrcution set 
so I got to work. I made tetroid NES. 

I always wanted todo a NES game in the past. I just never had motivation to sit through and do it. so I decided to use this to make a NES game
I made pong because its the most feasible project todo in 24 hours 



## What it does


its pong on the NES 

it can have 2 controllers if you happen to have the right dongles.
but you can play this on 2 controlers

the keyboard controls are however follows 

arrow keys to move paddle 1 

W and S to move the paddle 2 (depending on the emulator this is unbinded)

there is no score. so whoever hits out of bounds loses
and the player to cause this wins



## How we built it

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

load 

./build/build.nes into fcuex 

sand have fun

## Challenges we ran into

the constraints of the device and 6502 assembly

I only have 4kb of space which for pprespective its 1 JPEG



## Accomplishments that we're proud of

this entire project as a whole. I am proud I made it this far so far. I thought I would tap out and make some random
NES dev tool or something but here I am now. 

## What we learned

my intent of this project was to go in and come out. knowing the NES from both a dev prespective and an engineer prespective
now I think I achieved that. I am happy

## What's next for Pong NES

- collisions
- title screen
- sound
- score

I lowkey want to replace this with my final project for another class
we will see
