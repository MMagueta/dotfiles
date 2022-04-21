#!/bin/sh

set -eux
sudo nix build .#darwinConfigurations.MacMini.system --fallback --impure
sudo ./result/sw/bin/darwin-rebuild switch --flake . --fallback
