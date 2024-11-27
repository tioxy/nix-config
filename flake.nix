{
  description = "Multi-platform system configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
    let
      sharedOverlays = [ ];
      supportedSystems = [ "aarch64-darwin" ];

      genPkgs = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowBroken = true;
        };
        overlays = sharedOverlays;
      };

      forDarwin = system: hostName: darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          pkgs = genPkgs system;
        };
        modules = [
          ./hosts/darwin/${hostName}.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
              users =
                let
                  allUsers = {
                    tioxy = import ./modules/home-manager/tioxy;
                    work = import ./modules/home-manager/work;
                  };
                  targetUser = builtins.getEnv "SUDO_USER";
                  envUser = builtins.getEnv "USER";
                  effectiveUser = if targetUser != "" then targetUser else envUser;
                in
                if builtins.hasAttr effectiveUser allUsers then
                  { "${effectiveUser}" = allUsers.${effectiveUser}; }
                else
                  allUsers;
            };
          }
        ];
      };
    in
    {
      darwinConfigurations = {
        "Gabriels-MacBook-Pro" = forDarwin "aarch64-darwin" "macbook-pro";
      };

      devShells = nixpkgs.lib.genAttrs supportedSystems (system:
        let pkgs = genPkgs system; in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixpkgs-fmt
              statix
              # nix-linter is marked as broken, removed
            ];
          };
        }
      );
    };
}
