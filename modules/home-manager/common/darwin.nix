{ config, pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isDarwin {
  targets.darwin.defaults = {
    "com.apple.dock" = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.5;
      orientation = "bottom";
      showhidden = true;
      mineffect = "scale";
      launchanim = true;
      show-process-indicators = true;
    };

    "com.apple.finder" = {
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
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
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSWindowResizeTime = 0.001;
      NSScrollAnimationEnabled = false;
      "com.apple.springing.enabled" = true;
      "com.apple.springing.delay" = 0.0;
      "com.apple.swipescrolldirection" = false;
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
    };
  };
}
