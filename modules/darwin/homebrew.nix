{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
      # Newer Homebrew requires explicit force for `brew bundle --cleanup`.
      extraFlags = [ "--force" ];
    };

    # Disable homebrew tracking
    extraConfig =
      let
        ignoreUpdates = [
          "ableton-live-suite"
          "affinity"
          "discord"
          "steam"
          "windows-app"
        ];
      in
      lib.concatMapStringsSep "\n" (cask: "cask '${cask}', args: { require_sha: false, auto_updates: true }") ignoreUpdates;

    casks =
      let
        common = [
          "airbuddy"
          "alfred"
          "arc"
          "bettertouchtool"
          "cleanshot"
          "steipete/tap/codexbar"
          "ferdium"
          "google-chrome" # playwright only
          "keyclu"
          "logi-options+"
          "pdf-expert"
          "rocket"
          "voiceink"
        ];
        tioxy = [
          "ableton-live-suite"
          "affinity"
          "blender"
          "calibre"
          "caffeine" # home-manager breaking
          "cavalry"
          "discord"
          "folx"
          "godot"
          "krita"
          "mediahuman-audio-converter"
          "obs"
          "parsec"
          "rekordbox"
          "soulseek"
          "steam"
          "swinsian"
          "touchdesigner"
          "wacom-tablet"
        ];
        work = [
          "openwebstart"
          "windows-app"
          "yubico-authenticator"
        ];
      in
      common ++ tioxy ++ work;

    brews = [
      "mas"
      "pinentry-mac"
    ];

    masApps = {
      "CleanMyKeyboard" = 6468120888;
      "Dropover" = 1355679052;
      "Hand Mirror" = 1502839586;
      "Minizones" = 6504722514;
      "Things" = 904280696;
      "Xcode" = 497799835;
    };
  };
}
