{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gopls
		haskell-language-server
	];
}
