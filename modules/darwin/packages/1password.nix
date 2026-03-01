{
  programs = {
    # Required to avoid breaking 1password through home-manager
    # https://github.com/nix-darwin/nix-darwin/pull/1438/files
    _1password = {
      enable = true;
    };
    _1password-gui = {
      enable = true;
    };
  };
}
