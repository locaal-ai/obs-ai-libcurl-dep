#!/bin/bash
set -euo pipefail

CONFIG=${1?}
VERSION=${2?}

cmake curl -B build_$CONFIG \
  -DCURL_USE_OPENSSL=ON \
  -DBUILD_CURL_EXE=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DHTTP_ONLY=ON \
  -DCURL_USE_LIBSSH2=OFF \
  -DBUILD_TESTING=OFF \
  -DPICKY_COMPILER=OFF \
  -DCMAKE_BUILD_TYPE=$CONFIG \
  -DCMAKE_C_FLAGS="-fPIC" \
  -DCMAKE_CXX_FLAGS="-fPIC" \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON

cmake --build build_$CONFIG
cmake --install build_$CONFIG --prefix release/$CONFIG
tar -C release/$CONFIG -cvf release/libcurl-linux-$VERSION-$CONFIG.tar.gz .
