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

      forDarwin = system: hostName: user: darwin.lib.darwinSystem {
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
              users.${user} = import ./modules/home-manager/${user};
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };

      forHome = system: user: home-manager.lib.homeManagerConfiguration {
        pkgs = genPkgs system;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./modules/home-manager/${user}
        ];
      };
    in
    {
      darwinConfigurations = {
        "tioxy" = forDarwin "aarch64-darwin" "macbook-pro" "tioxy";
        "work" = forDarwin "aarch64-darwin" "macbook-pro" "work";
      };

      homeConfigurations = {
        "tioxy" = forHome "aarch64-darwin" "tioxy";
        "work" = forHome "aarch64-darwin" "work";
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
