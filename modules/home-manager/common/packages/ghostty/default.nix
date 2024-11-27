{ config, pkgs, lib, ... }: {
  xdg.configFile = {
    "ghostty/config".source = ./config;
  };

  home.packages = [ pkgs.ghostty-bin ];
}
