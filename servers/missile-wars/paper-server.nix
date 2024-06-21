{
  pkgs,
  plugins,
  resources,
}:
pkgs.stdenv.mkDerivation {
  name = "paper-missile-wars-server";
  src = ./config;
  installPhase = ''
    # Make directories
    mkdir -p $out/server/plugins

    # Copy over server config
    cp -r ${resources.config}/* $out/server

    # Prepare plugins
    cp -r ${plugins.missile-wars}/plugins/* $out/server/plugins
    cp -r ${plugins.world-edit}/plugins/* $out/server/plugins

    # Prepare the lobby
    ${pkgs.unzip}/bin/unzip ${resources.lobby} -d $out/server
  '';
}
