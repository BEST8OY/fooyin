#!/bin/sh -eux

pacman -Syu --noconfirm --needed \
    base-devel \
    git \
    cmake \
    ninja \
    ccache \
    glibc \
    icu \
    qt6-base \
    qt6-svg \
    qt6-tools \
    alsa-lib \
    taglib \
    ffmpeg \
    kdsingleapplication \
    qcoro-qt6 \
    hicolor-icon-theme \
    zlib \
    sdl2-compat \
    pipewire \
    libopenmpt \
    libgme \
    libsndfile \
    libarchive \
    libebur128 \
    libprojectm \
    libsoxr \
    soundtouch \
    vulkan-headers \
    gtest
