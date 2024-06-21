{ pkgs, missile-wars }:
pkgs.dockerTools.buildImage {
  name = "missile-wars";
  tag = "latest";
  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = [ pkgs.jdk21 missile-wars ];
    pathsToLink = [ "/bin" "/server" ];
  };
  config = {
    Cmd = [ "/bin/java -Xms2048M -Xmx2048M -jar .jar nogui" ];
    WorkingDir = "/server";
  };
}
