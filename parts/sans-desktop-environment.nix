{ config, pkgs, ... }:

{
  imports =
    [
		  ./default-networking.nix
    ];

  environment.systemPackages = with pkgs; [
    # bluetooth
		blueman
    bluez

		# system tray battery
		# cbatticon

		# The following command line tools are used in emacs plugin "desktop-environment":

		# command line screenshot
		scrot
		# control keyboard backlight through command line
		upower

	  brightnessctl
  ];

	# lock computer through command line
	programs.slock.enable = true;

	hardware.brightnessctl.enable = true;
}
