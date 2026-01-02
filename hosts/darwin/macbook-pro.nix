{ pkgs, ... }: {
  imports = [
    ./default.nix
  ];

  networking = {
    hostName = "Gabriels-MacBook-Pro";
    computerName = "Gabriel's MacBook Pro";
  };

  system.primaryUser = "tioxy";
  users.users = {
    tioxy = {
      name = "tioxy";
      home = "/Users/tioxy";
      shell = pkgs.zsh;
    };
    work = {
      name = "work";
      home = "/Users/work";
      shell = pkgs.zsh;
    };
  };
}
