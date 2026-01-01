{ config, pkgs, lib, ... }:

let
  sshAgentSock =
    if pkgs.stdenv.isDarwin
    then "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'"
    else "~/.1password/agent.sock";
  gitSignSSH =
    if pkgs.stdenv.isDarwin
    then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
in
{
  home = {
    packages = with pkgs; [
      _1password-gui
      _1password-cli
    ];
  };

  programs = {
    zsh = {
      initContent = lib.mkAfter ''
        source ~/.config/op/plugins.sh
      '';
    };

    ssh = {
      matchBlocks = {
        "*" = {
          extraOptions = {
            IdentityAgent = sshAgentSock;
          };
        };
      };
    };

    git = {
      settings = {
        commit.gpgsign = true;
        gpg = {
          format = "ssh";
          ssh.program = gitSignSSH;
        };
      };
      signing = {
        signByDefault = true;
      };
    };
  };
}
