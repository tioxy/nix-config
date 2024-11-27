{ config, pkgs, ... }: {
  home.packages = [ pkgs.zed-editor ];

  xdg.configFile."zed/settings.json".source = ./settings.json;
}
