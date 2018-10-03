#! /bin/bash
# script to setup cmake the build targets

BUILD_DIR="./build/"
mkdir -p ${BUILD_DIR}

EXTRA="
-DCMAKE_BUILD_TYPE=Debug
-DCMAKE_INSTALL_PREFIX=${BUILD_DIR}/install/
"

pushd ${BUILD_DIR}
cmake ../ --debug-output --trace-expand ${EXTRA}
popd
