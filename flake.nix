{
  description = "Wolf's Minecraft minigame server";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          images = {
            paper = pkgs.callPackage ./servers/paper { paper = ./servers/paper/paper.jar; };
          };
        };
        devShells = {
          default = pkgs.mkShell {
            packages = [
              pkgs.podman
              pkgs.podman-compose
            ];
          };
        };
      }
    );
}
