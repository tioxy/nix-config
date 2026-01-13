{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
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
          "ferdium"
          "keyclu"
          "logi-options+"
          "rocket"
          "voiceink"
        ];
        tioxy = [
          "ableton-live-suite"
          "affinity"
          "blender"
          "calibre"
          "discord"
          "folx"
          "godot"
          "mediahuman-audio-converter"
          "obs"
          "parsec"
          "soulseek"
          "steam"
          "swinsian"
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
      "PDFgear" = 6469021132;
      "Things" = 904280696;
      "Xcode" = 497799835;
    };
  };
}
