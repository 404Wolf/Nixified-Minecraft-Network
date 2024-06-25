{ pkgs }:
pkgs.writeShellScriptBin "start.sh" ''
  java=${pkgs.jdk21}/bin/java
  template=${./src}
  server=${./paper.jar}
  ${builtins.readFile ./start.sh}
''
