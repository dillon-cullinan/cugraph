#!/usr/bin/env bash
set -e

if [ "$BUILD_CUGRAPH" == "1" ]; then
  echo "Building cugraph"
  export CUDF_BUILD_NO_GPU_TEST=1

  if [ "$BUILD_ABI" == "1" ]; then
    conda build conda/recipes/cugraph -c rapidsai -c nvidia -c numba -c conda-forge -c defaults --python=$PYTHON
  else
    conda build conda/recipes/cugraph -c rapidsai/label/cf201901 -c nvidia/label/cf201901 -c numba -c conda-forge/label/cf201901 -c defaults --python=$PYTHON
  fi
fi
