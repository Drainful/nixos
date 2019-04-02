{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
			./guistuff.nix
    ];

  environment.systemPackages = with pkgs; [
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

	# Enable kde power managment.
	services.upower.enable = true;
}
