{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
			# X11
			xorg.xorgserver

			# Input modules
			xorg.xf86inputevdev
			xorg.xf86inputsynaptics
			xorg.xf86inputlibinput

			# Video modules
			xorg.xf86videointel

 			# Other
			jq
			xorg.xauth
  ];

	# DRI acceleration
	hardware.opengl.enable = true;
	hardware.opengl.driSupport = true;

  # services.xserver.displayManager.startx.enable = true;
}
