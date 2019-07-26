{ config, pkgs, ... }:

{
  imports =
    [];

  # Enable the X11 windowing system.
  services.xserver = {
	  enable = true;
    layout = "us";

		# dpi = 192;

		# libinput settings for mouse
		libinput = {
			enable = true;
			accelProfile = "flat";
			accelSpeed = "0.7";
		};
  };

	# Just to set all DPI in the same place
	fonts.fontconfig.dpi = 192;
}
