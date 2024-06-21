{
  description = "The famous missile wars Minecraft mini game packaged for papermc with Nix.";

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
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages = rec {
          default = import ./paper-server.nix {
            inherit pkgs;
            plugins = {
              inherit missile-wars world-edit;
            };
            resources = {
              lobby = ./resources/lobby.zip;
              config = ./config;
            };
          };
          missile-wars = import ./missile-wars.nix { inherit pkgs; };
          world-edit = import ./world-edit.nix { inherit pkgs; };
        };
        devShell = pkgs.mkShell {
          packages = [
            pkgs.lunar-client
            pkgs.papermc
          ];
        };
      }
    );

}
