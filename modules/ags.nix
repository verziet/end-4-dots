{ config, pkgs, lib, ... }:
let
  enabled = config.illogical-impulse.enable;
  selfPkgs = import ../pkgs { inherit pkgs; };
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