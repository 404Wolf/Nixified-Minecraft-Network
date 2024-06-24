{ pkgs, paper }:
pkgs.dockerTools.buildImage {
  name = "paper-minecraft-server";
  tag = "latest";
  config = {
    WorkingDir = "/server";
    Cmd = [ "${pkgs.jdk21}/bin/java" "-Xmx8G" "-Xms8G" "-jar" paper "nogui" ];
  };
}
