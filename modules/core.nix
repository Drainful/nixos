{ config, pkgs, ... }:

{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
      ./mysql.nix
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
  ];

  # enable developer manpages
  documentation.dev.enable = true;
}
