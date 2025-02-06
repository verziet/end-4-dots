{ lib, pkgs, ... }:
{
  options.illogical-impulse = {
    enable = lib.mkEnableOption "Enable illogical-impulse";
    hyprland = {
      monitor = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ",preferred,auto,1" ];
        description = "Monitor preferences for Hyprland";
      };
      ozoneWayland.enable = lib.mkEnableOption "Set NIXOS_OZONE_WL=1";
    };
    theme = {
      cursor = {
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.bibata-cursors;
        };
        theme = lib.mkOption {
          type = lib.types.str;
          default = "Bibata-Modern-Ice";
        };
      };
    };
  };
}