#!/bin/sh

set -eux
sudo nix build .#darwinConfigurations.MacMini.system -L
sudo ./result/sw/bin/darwin-rebuild switch --flake .
sudo nix-collect-garbage -d
