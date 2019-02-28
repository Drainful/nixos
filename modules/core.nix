{ config, pkgs, ... }:

{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
      ./mysql.nix
			./guistuff.nix
    ];

  environment.systemPackages = with pkgs; [
    st
    super-user-spark
    git
    python
    curl
    wget
    networkmanager
    neovim
    lsof
    fzf

    # vpn for accessing school server
    openconnect

    # backup through google drive
    gdrive

    # sync files
    rsync

    # C
    gcc 
    premake5

		# Racket
		racket

		# Red
		red
  ];
}
