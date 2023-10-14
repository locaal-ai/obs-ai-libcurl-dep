Param($Configuration)

cmake curl -B build_$Configuration `
  -DCURL_USE_OPENSSL=OFF `
  -DCURL_USE_SCHANNEL=ON `
  -DBUILD_CURL_EXE=OFF `
  -DBUILD_SHARED_LIBS=OFF `
  -DHTTP_ONLY=ON `
  -DCURL_USE_LIBSSH2=OFF `
  -DBUILD_TESTING=OFF `
  -DPICKY_COMPILER=OFF `
  -DCMAKE_BUILD_TYPE=Release


cmake --build build_$Configuration --config $Configuration
cmake --install build_$Configuration --config $Configuration --prefix release/$Configuration
Compress-Archive release\$Configuration\* release\libcurl-windows-$Configuration.zip -Verbose
