{ pkgs }:
pkgs.writeShellScriptBin "start.sh" ''
  java=${pkgs.jdk21}/bin/java
  ${builtins.readfile ./start.sh}
''
