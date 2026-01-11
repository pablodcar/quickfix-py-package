#!/usr/bin/env bash
WITH_MYSQL=${WITH_MYSQL:-0}

arguments=(--with-openssl)

pushd quickfix || exit
./bootstrap
./configure "${arguments[@]}" && make
# make check TODO: tests need to be fixed in the original quickfix
popd || exit

pushd quickfix/src/python || exit
echo "building Python interface..."
./swig.sh
popd || exit

./package-python.sh

if [[ "$TARGET_OS" == "Linux" ]]; then
    export CPPFLAGS="-DHAVE_SSL=1"
elif [[ "$TARGET_OS" == "macOS" ]]; then
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -DHAVE_SSL=1"
else
  echo "Unknown TARGET_OS: $TARGET_OS" >&2
  exit 1
fi

python -m cibuildwheel quickfix-py --output-dir dist
