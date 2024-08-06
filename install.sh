#!/bin/sh

cd /opt/everest-core

cmake -S . -B ./build -DBUILD_TESTING=ON

cmake --build ./build -j6 --target install
# cmake --build ./build --target install_everest_testing
