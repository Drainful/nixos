{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  # my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
      ./mysql.nix
			./python.nix
			./common-lisp.nix
			./virtualisation.nix
			./vpn.nix
			# ./lorri.nix
    ];

  environment.systemPackages = with pkgs; [
		# my_unstable.oraclejdk
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
		zip
		pmutils
		unstable.nixops

    # Wraps bad tui
    rlwrap

		# backup editor
    neovim

		# direnv for better nix-shell integration
		direnv

		# nox for better nix package searching
		nox

    # vpn for accessing school server
    openconnect

    # backup through google drive
    gdrive

    # sync files
    rsync

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

		mpd
		mpc_cli
  ];

  # enable developer manpages
  documentation.dev.enable = true;
}
