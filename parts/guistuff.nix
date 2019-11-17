{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports =
    [
			./fancyfonts.nix
    ];

  environment.systemPackages = with pkgs; [
	  # Browser
    my_unstable.firefox
		my_unstable.qutebrowser

		# torrenting
		qbittorrent

		# graphical file manager
		# dolphin

    # Media player 
		mpv

    # KDE partition manager
    # partition-manager
    lvm2

    # Terminal emulator
		alacritty

		# nethack-x11
		# nethack-qt

		# volume control
		pavucontrol

		# on-screen keyboard
		my_unstable.onboard
  ];

  nixpkgs.config = {
    firefox.enableAdobeFlash = true;
  };
}
