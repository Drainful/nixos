{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  # my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports = [];

  environment.systemPackages = with pkgs; [
		# minecraft
		unstable.multimc

		# ps2 emulator
		pcsx2

		unstable.lutris
  ];
}
