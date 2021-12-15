{ pkgs ? import <nixpkgs>{} }:

pkgs.stdenv.mkDerivation rec {
	name = "fluxd-wlc";
	version = "1.0.0";

	src = ./.;

	buildInputs = with pkgs; [
		wayland
		wayland-protocols
		egl-wayland
		glew
		libGL
		mesa
		libxkbcommon

		pkg-config

		xorg.libX11
	];

	configurePhase = ''
		echo "-- configure "
	'';

	buildPhase = ''
		make
	'';

	installPhase = ''
		mkdir -p $out/bin
		cp wayland-compositor $out/bin
	'';
}
