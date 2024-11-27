{ config, pkgs, ... }: {
  imports = [
    ./packages/nvim
    ./packages/zed
  ];

  home = {
    packages = with pkgs; [
      antigravity
      vscode
    ];

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      TERM = "xterm-256color";
    };
  };
}
