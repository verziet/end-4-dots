{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "illogical-impulse-ags";
  version = "latest";

  src = fetchFromGitHub {
    owner = "end-4";
    repo = "dots-hyprland";
    rev = "5c396d7548cf1f6d2460e5b1425301d0c960fc50";
    sha256 = "sha256-EMhcIApxaV7X2H88eNWekKDpd56OU7CeWImftlkoM8o=";
  };

  patches = [ 
    ./0001-Use-system-python-environment.patch
    ./0002-Kill-session-instead-of-kill-Hyprland.patch
  ];

  buildPhase = ''
    mkdir -p $out
    cp -r .config/ags/* $out/
  '';

  meta = {
    description = "Illogical Impulse AGS";
    homepage = "https://github.com/end-4/dots-hyprland";
    license = lib.licenses.gpl3;
  };
}
