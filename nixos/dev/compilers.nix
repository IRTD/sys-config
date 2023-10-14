{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		cmake
		gcc
		ghc
		go
	];
}
