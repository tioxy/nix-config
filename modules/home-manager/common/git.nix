{ config, pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        pull.rebase = false;
        core.editor = "vim";
        safe.directory = "*";
      };
    };

    gpg = {
      enable = true;
      settings = {
        keyserver = "hkps://keys.openpgp.org";
        pinentry-program = "/opt/homebrew/bin/pinentry-mac";
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 7200;
    enableSshSupport = true;
  };
}
