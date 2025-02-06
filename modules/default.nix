{ ... }:
{
  nixpkgs.overlays = [
    (import ../pkgs)
  ];

  imports = [
    ./options.nix
    ./anyrun.nix
    ./hyprland.nix
    ./kitty.nix
    ./zsh.nix
    ./hypridle.nix
    ./fuzzle.nix
    ./foot.nix
    ./packages.nix
    ./hyprlock.nix
    ./theme.nix
    ./ags.nix
  ];
}