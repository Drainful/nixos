{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
    # bluetooth
		blueman
    bluez

		# The following command line tools are used in emacs plugin "desktop-environment":

		# command line screenshot
		scrot
    # lock computer through command line
		slock
		# control keyboard backlight through command line
		upower
    # Enable brightnessctl in userspace
	  brightnessctl
  ];

  # Enable brightnessctl in userspace
	hardware.brightnessctl.enable = true;
}
