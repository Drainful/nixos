{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
	  # Firefox
    firefox

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

    #Document reader
    okular    

    # Media player 
    vlc

    # KDE apps
    kdeFrameworks.kconfig
    kdeFrameworks.kconfigwidgets
    konsole
    dolphin
    kdeApplications.dolphin-plugins

    # KDE partition manager
    partition-manager
    lvm2
  ];

  nixpkgs.config = {
    firefox.enableAdobeFlash = true;
  };
}
