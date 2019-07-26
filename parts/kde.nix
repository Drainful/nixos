{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
			./guistuff.nix
			./default-networking.nix
    ];

  environment.systemPackages = with pkgs; [
    # KDE apps
    kdeFrameworks.kconfig
    kdeFrameworks.kconfigwidgets
    konsole
    dolphin
    kdeApplications.dolphin-plugins

    kdeFrameworks.kwallet
    kdeApplications.kwalletmanager
    kwalletcli
                            

    kdeApplications.spectacle

    ktorrent

    kdeApplications.print-manager

  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

	# Enable kde power managment.
	services.upower.enable = true;
}
