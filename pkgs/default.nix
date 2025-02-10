{
  ags,
  pkgs,
}:
let
  inherit (pkgs) lib;
in
lib.fix(self: {
  illogical-impulse-ags = pkgs.callPackage ./illogical-impulse-ags {};
  illogical-impulse-ags-launcher = pkgs.callPackage ./illogical-impulse-ags-launcher { inherit ags; };
  illogical-impulse-hyprland-shaders = pkgs.callPackage ./illogical-impulse-hyprland-shaders {};
  illogical-impulse-kvantum = pkgs.callPackage ./illogical-impulse-kvantum {};
})