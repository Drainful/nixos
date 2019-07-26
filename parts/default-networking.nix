{ config, pkgs, ... }:

{
  imports =
    [];

  environment.systemPackages = with pkgs; [
	  networkmanagerapplet
		hicolor-icon-theme
		gnome3.gnome-keyring
  ];

  networking = {
		networkmanager.enable = true;
  };
	# programs.nm-applet.enable = true;
}
