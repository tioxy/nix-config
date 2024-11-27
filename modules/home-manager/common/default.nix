{ config, pkgs, ... }: {
  imports = [
    ./packages/1password
    ./packages/ghostty
    ./packages/starship
    ./coding.nix
    ./containers.nix
    ./git.nix
    ./os/darwin.nix
  ];

  home = {
    packages =
      let
        desktopApps = with pkgs; [
          obsidian
          protonmail-desktop
          spotify
        ];
        CLIs = with pkgs; [
          bat
          fd
          fzf
          jq
          ripgrep
          tmux
          tree
        ];
      in
      desktopApps ++ CLIs;
  };

  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      completionInit = "autoload -U compinit && compinit -u";
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      initContent = ''
        eval "$(direnv hook zsh)"
      '';
      shellAliases = {
        rebuild = "sudo darwin-rebuild switch --flake /etc/nix-config --impure";
        modules = "cd /etc/nix-config/modules";
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      baseIndex = 1;
      escapeTime = 0;
      terminal = "screen-256color";
    };
  };
}
