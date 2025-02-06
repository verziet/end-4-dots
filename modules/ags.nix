{ config, pkgs, lib, ... }:
let
  enabled = config.illogical-impulse.enable;
  selfPkgs = import ../pkgs { 
    inherit pkgs; 
    ags = config.illogical-impulse.hyprland.agsPackage; 
  };
in
{
  config = lib.mkIf enabled {
    # Expose the AGS launcher and AGS itself,
    # we need the launcher to launch the bar,
    # and AGS itself to toggle window.
    home.packages = (with selfPkgs; [
      illogical-impulse-ags-launcher
    ]) ++ [ 
      config.illogical-impulse.hyprland.agsPackage 
    ];

    # AGS Configuration
    home.file.".config/ags" = {
      source = "${selfPkgs.illogical-impulse-ags}";
      recursive = true;
    };
  };
}