{ config, pkgs, lib, ... }: {
  xdg.configFile = {
    "direnv/direnv.toml".source = ./direnv.toml;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
