{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in 
{
  imports =
    [
			./fancyfonts.nix
    ];

  environment.systemPackages = with pkgs; [
	  # Firefox
    unstable.firefox

		# qute
		unstable.qutebrowser

		qbittorrent

    # Emacs but worse
    idea.idea-community
    simple-scan

		# Gui archive manager
    ark

    # Image viewer

    #Document reader
    okular    

    # Media player 
    vlc
		mpv

    # KDE partition manager
    partition-manager
    lvm2

    # Terminal emulator
		alacritty

		nethack-x11
		nethack-qt

		# volume control
		pavucontrol

		# flash
		unstable.flashplayer-standalone
  ];

  nixpkgs.config = {
    firefox.enableAdobeFlash = true;
  };
}
