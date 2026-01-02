{ config, pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isDarwin {
  targets.darwin.defaults = {
    "com.apple.dock" = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.5;
      launchanim = true;
      mineffect = "scale";
      orientation = "bottom";
      show-process-indicators = true;
      showhidden = true;
      tilesize = 48;
    };

    "com.apple.finder" = {
      _FXShowPosixPathInTitle = false;
      _FXSortFoldersFirst = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = true;
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      "com.apple.springing.delay" = 0.0;
      "com.apple.springing.enabled" = true;
      "com.apple.swipescrolldirection" = false;
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSScrollAnimationEnabled = false;
      NSWindowResizeTime = 0.001;
    };
  };
}
