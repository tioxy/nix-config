# Host-specific configuration for Gabriel's MacBook Pro
{ pkgs, lib, ... }:

{
  # Import all the modules we need
  imports = [
    ./default.nix # Import common Darwin host configuration
  ];

  # Host identification
  networking.hostName = "Gabriels-MacBook-Pro";
  networking.computerName = "Gabriel's MacBook Pro";

  # NOTE: Host-specific homebrew packages are handled in modules/darwin/homebrew/default.nix
  # by the machine-specific configuration based on hostName

  # Host-specific packages
  environment.systemPackages = with pkgs; [
    # Add any machine-specific packages here
  ];

  # Host-specific system preferences
  system.defaults.dock.tilesize = 48;

  system.primaryUser = "tioxy";
}
