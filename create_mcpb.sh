#!/bin/bash

version=$1

ls -la bin

echo "Decompressing .xz binaries in bin/..."
for file in bin/*.xz; do
  [ -e "$file" ] || continue
  echo "Decompressing $file"
  xz -d -k "$file"
done

mv bin/pty-mcp-server-macos-aarch64 bin/pty-mcp-server
mv bin/pty-mcp-server-windows-no-mingw.exe bin/pty-mcp-server.exe

mcpb pack . pty-mcp-server-${version}.mcpb

ls -la download

exit 0
