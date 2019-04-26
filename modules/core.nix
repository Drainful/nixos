{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in 
{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
      ./mysql.nix
			./python.nix
			# ./lorri.nix
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
		zip

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

    unstable.wine
		unstable.winetricks

		# better x keybindings
    xcape
  ];

  # enable developer manpages
  documentation.dev.enable = true;
}
