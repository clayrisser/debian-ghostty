#!/bin/sh

set -e
cd "$(dirname "$0")/.."
export ZIG_GLOBAL_CACHE_DIR="$(pwd)/zig-cache"
rm -rf "$ZIG_GLOBAL_CACHE_DIR"
zig build --fetch
tar -czf zig-deps.tar.gz zig-cache/
