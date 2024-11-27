{ config, pkgs, lib, ... }: {
  xdg.configFile = {
    "starship.toml".source = ./starship.toml;
  };

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      initContent = lib.mkAfter ''
        eval "$(starship init zsh)"
      '';
    };
  };
}
