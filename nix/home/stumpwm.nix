{ config, inputs, lib, pkgs, ... }:
with lib;

{
    home.file = {
      ".stumpwm.d" = {
        source = ../../stumpwm;
        recursive = true;
      };
      ".config/polybar" = {
        source = ../../polybar;
        recursive = true;
      };
    };
}
