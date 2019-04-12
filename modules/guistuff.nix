{ config, pkgs, ... }:

{
  imports =
    [
		./fancyfonts.nix
    ];

  environment.systemPackages = with pkgs; [
	  # Firefox
    firefox

    # Spotify client
		spotify

    # Emacs but worse
    idea.idea-community

    # Password manager for KDE
    kdeFrameworks.kwallet
    kdeApplications.kwalletmanager
    kwalletcli
                            
    ark

    # Screenshots
    kdeApplications.spectacle

    # Torrenting
    ktorrent

    # Printing and scanning
    kdeApplications.print-manager
    simple-scan

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
  ];

  nixpkgs.config = {
    firefox.enableAdobeFlash = false;
  };
}
