Param($Configuration, $Version)

# Set CMAKE_C_COMPILER_LAUNCHER and CMAKE_CXX_COMPILER_LAUNCHER
cmake curl -B build_$Configuration `
  -DCMAKE_C_COMPILER_LAUNCHER=ccache `
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache `
  -DCURL_USE_OPENSSL=OFF `
  -DCURL_USE_SCHANNEL=ON `
  -DBUILD_CURL_EXE=OFF `
  -DBUILD_SHARED_LIBS=OFF `
  -DHTTP_ONLY=ON `
  -DCURL_USE_LIBSSH2=OFF `
  -DBUILD_TESTING=OFF `
  -DPICKY_COMPILER=OFF `
  -DCMAKE_BUILD_TYPE=$Configuration

cmake --build build_$Configuration --config $Configuration
cmake --install build_$Configuration --config $Configuration --prefix release/$Configuration
Compress-Archive release\$Configuration\* release\libcurl-windows-$Version-$Configuration.zip -Verbose
