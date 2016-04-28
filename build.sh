#!/bin/bash

bin2c -st -c -t char -n v8_natives_blob natives_blob.bin > natives_blob.cc
bin2c -st -c -t char -n v8_snapshot_blob snapshot_blob.bin > snapshot_blob.cc

g++ -O2 -std=c++11 -I"v8/include" main.cc -o pixelscript -Wl,--start-group \
v8/out/x64.release/obj.target/{tools/gyp/libv8_{base,libbase,external_snapshot,libplatform},third_party/icu/libicu{uc,i18n,data}}.a -Wl,--end-group \
-lrt -ldl -pthread -lSDL2

#g++ -static -static-libstdc++ -static-libgcc -O2 -std=c++11 -I"v8/include" sdl.cc -o engine -Wl,--start-group \
#v8/out/x64.release/obj.target/{tools/gyp/libv8_{base,libbase,external_snapshot,libplatform},third_party/icu/libicu{uc,i18n,data}}.a -Wl,--end-group \
#-lrt -ldl -pthread -Wl,-Bstatic \
#$(sdl-config --static-libs) -Wl,-Bdynamic #-lSDL2

