#!/bin/bash
# Script to setup cmake the build targets

BUILD_DIR="./build"
mkdir -p ${BUILD_DIR}

debug_EXTRA="
-DCMAKE_BUILD_TYPE=Debug
-DCMAKE_INSTALL_PREFIX=${BUILD_DIR}/install/
"

profile_EXTRA="
-DCMAKE_BUILD_TYPE=Release
-DCMAKE_INSTALL_PREFIX=${BUILD_DIR}/install/
"

bootstrap_target()
{
    pushd $1
    cmake ../.. --debug-output --trace-expand $2
    popd
}

for TARGET in debug profile; do
    TARGET_DIR="${BUILD_DIR}/${TARGET}"
    mkdir -p ${TARGET_DIR}

    EXTRA="${TARGET}_EXTRA"

    (bootstrap_target ${TARGET_DIR} "${!EXTRA}")
done
