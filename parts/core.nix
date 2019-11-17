{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports =
    [ 
      ./mysql.nix
			./python.nix
			./common-lisp.nix
			./vpn.nix
			./mpd.nix
    ];

  environment.systemPackages = with pkgs; [
    # for setting up dotfiles
    super-user-spark

    # Version control
    git
		subversion19

    # tools
    curl
    wget
    networkmanager
    lsof
    fzf
		atool # archive utility
		unrar
		p7zip
		zip
		unzip
		pmutils
		nixops
		telnet
		ripgrep # fast searching tool
		youtube-dl
		ffmpeg
		direnv
		neofetch
		killall
		file
		usbutils

		# shell (literally just for eshell completions)
		fish

    # Wraps bad tui
    rlwrap

		# backup editor
    neovim

		# direnv for better nix-shell integration
		direnv

		# nox for better nix package searching
		nox

    # vpn for accessing school server
    # openconnect

    # C++ man pages
		manpages

    wine
		winetricks

		# better x keybindings
    xcape

		# audio mixer
		aumix

		# Passwd manager
		bitwarden-cli
  ];

	# enable developer manpages
  documentation.dev.enable = true;
}
