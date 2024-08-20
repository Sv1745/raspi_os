#!/bin/bash

# List of commands to be removed
commands_to_remove=(
    "7z"
    "7za"
    "7zr"
    "aarch64-linux-gnu-addr2line"
    "aarch64-linux-gnu-ar"
    "aarch64-linux-gnu-as"
    "aarch64-linux-gnu-c++filt"
    "aarch64-linux-gnu-cpp"
    "aarch64-linux-gnu-cpp-12"
    "aarch64-linux-gnu-dwp"
    "aarch64-linux-gnu-elfedit"
    "aarch64-linux-gnu-g++"
    "aarch64-linux-gnu-g++-12"
    "aarch64-linux-gnu-gcc"
    "aarch64-linux-gnu-gcc-12"
    "aarch64-linux-gnu-gcc-ar"
    "aarch64-linux-gnu-gcc-ar-12"
    "aarch64-linux-gnu-gcc-nm"
    "aarch64-linux-gnu-gcc-nm-12"
    "aarch64-linux-gnu-gcc-ranlib"
    "aarch64-linux-gnu-gcc-ranlib-12"
    "aarch64-linux-gnu-gcov"
    "aarch64-linux-gnu-gcov-12"
    "aarch64-linux-gnu-gcov-dump"
    "aarch64-linux-gnu-gcov-dump-12"
    "aarch64-linux-gnu-gcov-tool"
    "aarch64-linux-gnu-gcov-tool-12"
    "aarch64-linux-gnu-gold"
    "aarch64-linux-gnu-gp-archive"
    "aarch64-linux-gnu-gp-collect-app"
    "aarch64-linux-gnu-gp-display-html"
    "aarch64-linux-gnu-gp-display-src"
    "aarch64-linux-gnu-gp-display-text"
    "aarch64-linux-gnu-gprof"
    "aarch64-linux-gnu-gprofng"
    "aarch64-linux-gnu-ld"
    "aarch64-linux-gnu-ld.bfd"
    "aarch64-linux-gnu-ld.gold"
    "aarch64-linux-gnu-lto-dump"
    "aarch64-linux-gnu-lto-dump-12"
    "aarch64-linux-gnu-nm"
    "aarch64-linux-gnu-objcopy"
    "aarch64-linux-gnu-objdump"
    "aarch64-linux-gnu-pkgconf"
    "aarch64-linux-gnu-pkg-config"
    "aarch64-linux-gnu-python3.11-config"
    "aarch64-linux-gnu-python3-config"
    "aarch64-linux-gnu-ranlib"
    "aarch64-linux-gnu-readelf"
    "aarch64-linux-gnu-size"
    "aarch64-linux-gnu-strings"
    "aarch64-linux-gnu-strip"
    "ab"
    "ar"
    "as"
    "c++"
    "c89"
    "c89-gcc"
    "c99"
    "c99-gcc"
    "cpp"
    "cpp-12"
    "dwp"
    "elfedit"
    "gcc"
    "gcc-12"
    "gcc-ar"
    "gcc-ar-12"
    "gcc-nm"
    "gcc-nm-12"
    "gcc-ranlib"
    "gcc-ranlib-12"
    "gcov"
    "gcov-12"
    "gcov-dump"
    "gcov-dump-12"
    "gcov-tool"
    "gcov-tool-12"
    "g++"
    "g++-12"
    "ld"
    "ld.bfd"
    "ld.gold"
    "lto-dump"
    "lto-dump-12"
    "nm"
    "objcopy"
    "objdump"
    "ranlib"
    "size"
    "strings"
    "strip"
    "vdir"
)

# Remove the commands
for cmd in "${commands_to_remove[@]}"; do
    sudo rm -f "/usr/bin/$cmd"
done

echo "Selected commands have been removed."
