{ pkgs, ... }: {
  users.users.tioxy = {
    name = "tioxy";
    home = "/Users/tioxy";
    shell = pkgs.zsh;
  };

  users.users.work = {
    name = "work";
    home = "/Users/work";
    shell = pkgs.zsh;
  };
}
