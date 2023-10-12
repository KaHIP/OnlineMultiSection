#!/bin/bash

rm -rf deploy
rm -rf build
mkdir build
cd build 
cmake ../
make -j 
cd ..

mkdir deploy
cp ./build/streammultisection deploy/

rm -rf build
