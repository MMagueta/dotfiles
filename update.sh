set -eux
sudo nixos-rebuild build --flake . --impure
sudo nixos-rebuild switch --flake . --impure
nix-collect-garbage -d
