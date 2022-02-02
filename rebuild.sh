#!/bin/sh

set -eux
sudo nix build .#darwinConfigurations.MacMini.system --fallback
sudo ./result/sw/bin/darwin-rebuild switch --flake . --fallback
