{ config, pkgs, ... }:

{
	imports = 
	[
		./compilers.nix
		./util.nix
		./lsp.nix
	];
}
