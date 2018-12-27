{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
    ];

  environment.systemPackages = with pkgs; [

    # Password manager for KDE
    kdeFrameworks.kwallet
    kdeApplications.kwalletmanager
    kwalletcli
                            
    ark

    # Screenshots
    kdeApplications.spectacle

    # bluetooth
    bluedevil
    bluez

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
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
