{ config, pkgs, ... }: {
  imports = [
    ./packages/nvim
    ./packages/zed
  ];

  home = {
    packages = with pkgs; [
      antigravity
      gh
      vscode
    ];

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      TERM = "xterm-256color";
    };
  };

  programs = {
    zsh = {
      shellAliases = {
        agy = "antigravity";
      };
    };
  };
}
