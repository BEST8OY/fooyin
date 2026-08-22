#!/bin/sh

export FOOYIN_DIR=$PWD
BUILD_CCACHE="${BUILD_CCACHE:-ON}"
BUILD_PCH="${BUILD_PCH:-ON}"

cmake -S "$FOOYIN_DIR" \
  -G Ninja \
  -B build \
  -W no-author \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_PCH="$BUILD_PCH" \
  -DBUILD_TESTING=ON \
  -DINSTALL_HEADERS=ON \
  -DBUILD_CCACHE="$BUILD_CCACHE"

cmake --build build
if [ "$BUILD_CCACHE" = "ON" ]; then
  ccache --show-stats || true
fi

DESTDIR="$FOOYIN_DIR/pkg" cmake --install build
mkdir -p "$FOOYIN_DIR/arch"
tar -czvf "$FOOYIN_DIR/arch/fooyin-archlinux-x86_64.tar.gz" -C "$FOOYIN_DIR/pkg" .
