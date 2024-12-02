build(){
    mkdir -p ./build/Release
    cl65  --target nes ./src/main.s -o ./build/Release/build.nes
    rm ./src/main.o
}
build