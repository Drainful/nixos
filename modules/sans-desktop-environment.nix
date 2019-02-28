{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
	  # network management
    networkmanager
	  networkmanagerapplet
    # bluetooth
    bluedevil
    bluez
		# status bar
		dzen2
		# cbatticon
  ];
}
