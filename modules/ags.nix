{ config, inputs, pkgs, lib, ... }:
let
  enabled = config.illogical-impulse.enable;
    selfPkgs = import ../pkgs { 
    inherit pkgs; 
    ags = inputs.ags.packages.${pkgs.system}.default; 
  };
in
{
  config = lib.mkIf enabled {
    # Expose the AGS launcher
    home.packages = with selfPkgs; [
      illogical-impulse-ags-launcher
    ];

    # AGS Configuration
    home.file.".config/ags" = {
      source = "${selfPkgs.illogical-impulse-ags}";
      recursive = true;
    };
  };
}