{ config, pkgs, ... }: {
  imports = [
    ../common
  ];

  home = {
    username = "work";
    homeDirectory = "/Users/work";
    stateVersion = "25.11";

    packages = with pkgs; [
      slack
    ];
  };

  programs = {
    home-manager.enable = true;

    git = {
      settings = {
        user = {
          name = "Gabriel Tiossi";
          email = "mail@tioxy.com";
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGolPIcQgU5xCaEic2Ol6Egv8tMf4aPvfQDvZoAgSXv7";
        };
      };
    };

    gpg = {
      settings = {
        default-key = "BD4BD0A2A7E59A46";
      };
    };
  };
}
