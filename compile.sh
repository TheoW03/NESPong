build(){
    mkdir -p ./build
    cl65  --target nes ./src/main.s -o ./build/build.nes
    rm ./src/main.o
}
build