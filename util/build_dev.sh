#!/bin/bash
set -e

pkill easyeffects 2>/dev/null || true

rm -rf install

cmake -B build -S . \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Debug \
    -D CMAKE_INSTALL_PREFIX="$PWD/install" \
    -D CMAKE_CXX_FLAGS="-fsanitize=address" \
    -Wno-dev

cmake --build build --parallel $(nproc)

cmake --install build

echo "Build complete. Run ./run_dev.sh to test."
