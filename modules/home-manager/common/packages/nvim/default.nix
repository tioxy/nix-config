{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Language servers
      lua-language-server
      nil # Nix LS
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted # html, css, json, eslint

      # Tools
      ripgrep
      fd
      tree-sitter

      # Optional dependencies
      git
      nodejs
      gcc
    ];
  };

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
}
