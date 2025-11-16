#!/bin/bash

version=$1

ls -la bin

echo "Decompressing .xz binaries in ./"
for file in *.xz; do
  [ -e "$file" ] || continue
  echo "Decompressing $file"
  xz -d -k "$file"
done

mv bin/pty-mcp-server-macos-aarch64-${version} bin/pty-mcp-server
mv bin/pty-mcp-server-windows-no-mingw-${version}.exe bin/pty-mcp-server.exe

mcpb pack . pty-mcp-server-${version}.mcpb

exit 0
