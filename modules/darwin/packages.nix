{ config, pkgs, lib, ... }: {
  environment = {
    # All users, including root
    systemPackages = with pkgs; [
      bottom
      cmake
      coreutils
      curl
      duf
      gcc
      git
      gnumake
      htop
      ncdu
      openssh
      vim
      wget
    ];

    systemPath = [ "/opt/homebrew/bin" ]; # For Homebrew if used
    pathsToLink = [ "/Applications" ];

    etc."gitconfig".text = ''
      [safe]
        directory = *
    '';
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      enableBashCompletion = true;
    };

    _1password = {
      enable = true;
    };
    _1password-gui = {
      enable = true;
    };
  };
}
