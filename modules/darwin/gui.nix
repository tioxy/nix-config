{ config, pkgs, ... }: {
  system = {
    activationScripts.extraActivation.text = ''
      # Enable Bluetooth debugging
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableBluetoothDebugLogs 1
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableTailLog 1
    '';

    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        mineffect = "scale";
        launchanim = true;
        show-process-indicators = true;
      };

      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv"; # list view
        FXRemoveOldTrashItems = true;
        ShowStatusBar = true;
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        ShowPathbar = true;
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
      };

      NSGlobalDomain = {
        # Text behavior
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;

        # Window behavior
        NSWindowResizeTime = 0.001; # Make window resizing faster
        NSScrollAnimationEnabled = false; # Disable scroll animations

        # Other settings
        "com.apple.springing.enabled" = true; # Enable spring loading
        "com.apple.springing.delay" = 0.0; # No delay for spring loading
        "com.apple.swipescrolldirection" = false;
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };

      spaces = {
        spans-displays = false; # Separate spaces on each display
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
