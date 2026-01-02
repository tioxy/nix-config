{ lib, ... }: {
  imports = [
    ./homebrew.nix
    ./packages.nix
  ];

  ids.gids.nixbld = 350; # Fix for nixbld group ID mismatch
  system = {
    stateVersion = 6;
    activationScripts.extraActivation.text = lib.mkAfter ''
      # Enable Bluetooth debugging
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableBluetoothDebugLogs 1
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableTailLog 1
    '';
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

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
