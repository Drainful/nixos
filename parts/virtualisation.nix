{ config, pkgs, ... }:
let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in 
{
  imports = [];

  environment.systemPackages = with pkgs; [];

	virtualisation = {
		virtualbox = {
			host.enable = true;
		};
	};
}
