{
  imports = [
    ./gui.nix
    ./homebrew.nix
    ./packages.nix
    ./users.nix
  ];

  system.stateVersion = 6;
  ids.gids.nixbld = 350; # Fix for nixbld group ID mismatch
  security.pam.services.sudo_local.touchIdAuth = true; # Enable Touch ID for sudo

  nix = {
    enable = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@admin" "tioxy" "root" "work" ];
      substituters = [
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
      interval = { Weekday = 0; Hour = 2; Minute = 0; }; # Run at 2:00am on Sundays
    };
  };
}
