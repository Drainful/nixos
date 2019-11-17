{ config, pkgs, ... }:

let
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports =
    [ 
    ];

  environment.systemPackages = with pkgs; [
		mpd
		mpc_cli
  ];

	# services.mpd = {
	# 	enable = true;

	# };
}
