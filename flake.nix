{
  description = "Multi-platform system configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
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

      users = {
        tioxy = { system = "aarch64-darwin"; hostname = "macbook-pro"; };
        work = { system = "aarch64-darwin"; hostname = "macbook-pro"; };
      };
    in
    {
      darwinConfigurations = nixpkgs.lib.mapAttrs
        (user: conf: forDarwin conf.system conf.hostname user)
        users;

      homeConfigurations = nixpkgs.lib.mapAttrs
        (user: conf: forHome conf.system user)
        users;

      devShells = nixpkgs.lib.genAttrs supportedSystems (system:
        let pkgs = genPkgs system; in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixpkgs-fmt
              statix
            ];
          };
        }
      );
    };
}
