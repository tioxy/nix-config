{ config, pkgs, lib, ... }: {
  # Requires manual importing in the tool
  xdg.configFile."bettertouchtool" = {
    source = ./presets;
    recursive = true;
  };
}
