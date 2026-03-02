{ lib, ... }: {
  services.tailscale.enable = true;
  networking.dns = lib.mkBefore [ "100.100.100.100" ];
}
