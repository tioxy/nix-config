{ config, pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    # Disable homebrew tracking
    extraConfig = ''
      cask 'ableton-live-suite', args: { require_sha: false, auto_updates: true }
      cask 'affinity', args: { require_sha: false, auto_updates: true }
      cask 'discord', args: { require_sha: false, auto_updates: true }
      cask 'steam', args: { require_sha: false, auto_updates: true }
    '';

    casks = [
      "ableton-live-suite"
      "affinity"
      "airbuddy"
      "alfred"
      "arc"
      "bettertouchtool"
      "blender"
      "calibre"
      "cleanshot"
      "discord"
      "ferdium"
      "folx"
      "godot"
      "keyclu"
      "logi-options+"
      "mediahuman-audio-converter"
      "obs"
      "parsec"
      "soulseek"
      "steam"
      "swinsian"
      "voiceink"
    ];

    brews = [
      "mas"
      "pinentry-mac"
    ];

    masApps = {
      "Xcode" = 497799835;
      "Things" = 904280696;
      "Dropover" = 1355679052;
    };

    taps = [
      "homebrew/services"
    ];
  };
}
