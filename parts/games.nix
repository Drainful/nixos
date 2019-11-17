{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports = [];

  environment.systemPackages = with pkgs; [
		# minecraft
		my_unstable.multimc

		# pcsx2 # ps2 emulator
		# mednafen # ps1 emulator
		# azimuth

		lutris
  ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

	 # increase ulimit for lutris
	systemd.extraConfig = ''DefaultLimitNOFILE=524288'';
	systemd.user.extraConfig = ''DefaultLimitNOFILE=524288'';

	security.pam.loginLimits = [{
		domain = "*";
		type = "soft";
		item = "nofile";
		value = "524288";
	}];
}
