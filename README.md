# nix-config

Unified configuration for macOS (nix-darwin), managed via Nix Flakes and Home Manager.

## Quick Start

### 1. Clone the folder

Clone the repsitory and move it to a shared folder.
If changing the folder, change the alias `rebuild` for it.

```bash
git clone git@github.com:tioxy/nix-darwin.git /etc/nix-config
sudo mv nix-darwin /etc/nix-config
```

### 2. Allow direnv

Ensure tooling is available by allowing direnv to access the flake.

```bash
cd /etc/nix-config
direnv allow
```

### 3. Apply configuration

Apply the configuration using darwin-rebuild.
Impure is used to allow multiple users to use the same configuration and avoid permission errors.
Check [flake.nix](flake.nix) for more information.

```bash
# Impure is required as the configuration uses the current user to set home-manager
sudo darwin-rebuild switch --flake /etc/nix-config --impure
```

## Structure

```bash
├── flake.nix           # Entry point & Inputs
├── hosts/
│   └── darwin/         # Machine-specific settings for macOS hosts (e.g., macbook-pro)
└── modules/
    ├── darwin/         # macOS system modules
    └── home-manager/   # User configurations
        ├── common/     # Shared user settings
        ├── packets/    # Individual package modules
        ├── tioxy/      # User 'tioxy' specific
        └── work/       # User 'work' specific
```
