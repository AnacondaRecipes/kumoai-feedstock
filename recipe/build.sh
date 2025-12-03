#!/bin/bash

set -xe

# install using pip from the whl files on PyPI

if [ `uname` == Darwin ]; then  
    if [ "$PY_VER" == "3.10" ]; then
        WHL_FILE=kumoai-${PKG_VERSION}-cp310-cp310-macosx_11_0_arm64.whl
        curl -Lso "$WHL_FILE" https://pypi.org/packages/cp310/k/kumoai/kumoai-${PKG_VERSION}-cp310-cp310-macosx_11_0_arm64.whl
    elif [ "$PY_VER" == "3.11" ]; then
        WHL_FILE=kumoai-${PKG_VERSION}-cp311-cp311-macosx_11_0_arm64.whl
        curl -Lso "$WHL_FILE" https://pypi.org/packages/cp311/k/kumoai/kumoai-${PKG_VERSION}-cp311-cp311-macosx_11_0_arm64.whl
    elif [ "$PY_VER" == "3.12" ]; then
        WHL_FILE=kumoai-${PKG_VERSION}-cp312-cp312-macosx_11_0_arm64.whl
        curl -Lso "$WHL_FILE" https://pypi.org/packages/cp312/k/kumoai/kumoai-${PKG_VERSION}-cp312-cp312-macosx_11_0_arm64.whl
    elif [ "$PY_VER" == "3.13" ]; then
        WHL_FILE=kumoai-${PKG_VERSION}-cp313-cp313-macosx_11_0_arm64.whl
        curl -Lso "$WHL_FILE" https://pypi.org/packages/cp313/k/kumoai/kumoai-${PKG_VERSION}-cp313-cp313-macosx_11_0_arm64.whl
    fi
fi

echo "ARCH: $ARCH ..."

if [ `uname` == Linux ]; then
    # No sources for linux aarch64 on pypi -> https://pypi.org/project/kumoai/#files
    # Build linux aarch64 from -> kumoai-2.12.0-py3-none-any.whl
    if [ "$target_platform" == "linux-aarch64" ]; then
        WHL_FILE=https://pypi.org/packages/py3/k/kumoai/kumoai-${PKG_VERSION}-py3-none-any.whl
    elif [ "$target_platform" == "linux-64" ]; then
        if [ "$PY_VER" == "3.10" ]; then
            WHL_FILE=https://pypi.org/packages/cp310/k/kumoai/kumoai-${PKG_VERSION}-cp310-cp310-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
        elif [ "$PY_VER" == "3.11" ]; then
            WHL_FILE=https://pypi.org/packages/cp311/k/kumoai/kumoai-${PKG_VERSION}-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
        elif [ "$PY_VER" == "3.12" ]; then
            WHL_FILE=https://pypi.org/packages/cp312/k/kumoai/kumoai-${PKG_VERSION}-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
        elif [ "$PY_VER" == "3.13" ]; then
            WHL_FILE=https://pypi.org/packages/cp313/k/kumoai/kumoai-${PKG_VERSION}-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
        fi
    fi

    
fi

$PYTHON -m pip install --no-deps --no-build-isolation -vvv $WHL_FILE