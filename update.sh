set -eux
sudo nixos-rebuild switch --flake .
# nix-collect-garbage -d
