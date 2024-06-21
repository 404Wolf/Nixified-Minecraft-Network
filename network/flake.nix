{
  description = "Wolf's Minecraft minigame server";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    missile-wars.url = "path:../servers/missile-wars";
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
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages = {
          docker-images = {
            missile-wars = import ./servers/missile-wars.nix {
              inherit pkgs;
              missile-wars = inputs.missile-wars;
            };
          };
        };
      }
    );
}
