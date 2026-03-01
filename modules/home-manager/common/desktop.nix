{ config, pkgs, ... }: {
  home = {
    packages =
      let
        default = with pkgs; [
          obsidian
          protonmail-desktop
          spotify
          tailscale
        ];

        darwin = with pkgs; [
          caffeine
          ice-bar
          iina
          itsycal
          numi
        ];
      in
      with pkgs; default ++ lib.optionalAttrs stdenv.isDarwin darwin;
  };
}
