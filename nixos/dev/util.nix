{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		rustup
		nodejs
		docker
		docker-client
		surrealdb
		surrealdb-migrations
		cabal-install
		cabal2nix
	];
}
