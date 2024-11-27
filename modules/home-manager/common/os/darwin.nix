{ config, pkgs, ... }: {
  home = pkgs.lib.mkIf pkgs.stdenv.isDarwin {
    packages = with pkgs; [
      caffeine
      ice-bar
      iina
      itsycal
      numi
      raycast
    ];
  };
}
