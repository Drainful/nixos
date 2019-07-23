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

    # Spotify client
		spotify

    # Emacs but worse
    idea.idea-community
    simple-scan

		# Gui archive manager
    ark

    # Image viewer
    gwenview
		feh

    #Document reader
    okular    

    # Media player 
    vlc

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
