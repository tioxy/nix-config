{ config, pkgs, ... }:
let
  containerRuntime = if pkgs.stdenv.isDarwin then pkgs.colima else pkgs.docker;
in
{
  home = {
    packages = with pkgs; [
      containerRuntime
      dive
      docker-client
      docker-compose
      docker-compose-language-service
      k9s
      kubectl
    ];
  };

  programs = {
    zsh = {
      shellAliases = {
        k = "kubectl";
      };
    };
  };
}
