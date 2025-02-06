{
  description = "Illogical Impulse Hyprland Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, anyrun, systems }: let
    inherit (nixpkgs) lib;
    eachSystem = lib.genAttrs (import systems);
  in {
    legacyPackages = eachSystem (
      system:
      import ./pkgs {
        pkgs = nixpkgs.legacyPackages.${system};
      }
    );
    homeManagerModules.default = import ./modules self;
  };
}
