#!/bin/bash
set -euo pipefail

cmake libcurl -B build_$1 \
  -DCURL_USE_OPENSSL=ON \
  -DBUILD_CURL_EXE=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DHTTP_ONLY=ON \
  -DCURL_USE_LIBSSH2=OFF \
  -DBUILD_TESTING=OFF \
  -DPICKY_COMPILER=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_FLAGS="-fPIC" \
  -DCMAKE_CXX_FLAGS="-fPIC" \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON

cmake --build build_$1
cmake --install build_$1 --prefix release/$1
tar -C release/$1 -cvf release/libcurl-linux-$1.tar.gz .
