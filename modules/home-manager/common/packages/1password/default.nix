{ config, pkgs, lib, ... }:

let
  sshExtraOption = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
  gitSSHProgram = "${pkgs._1password-gui}/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
in
{
  home = {
    packages = with pkgs; [
      _1password-gui
      _1password-cli
    ];
  };

  programs = {
    ssh = {
      matchBlocks = {
        "*" = {
          extraOptions = {
            IdentityAgent = sshExtraOption;
          };
        };
      };
    };

    git = {
      settings = {
        commit.gpgsign = true;
        gpg = {
          format = "ssh";
          ssh.program = gitSSHProgram;
        };
      };
      signing = {
        signByDefault = true;
      };
    };
  };
}
