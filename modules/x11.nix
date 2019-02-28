{ config, pkgs, ... }:

{
  imports =
    [];

  # Enable the X11 windowing system.
  services.xserver = {
	  enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
		# actually 282, but apparently a multiple of 96 is best? also 282
		# is too large
		dpi = 192;
  };

	# Just to set all DPI in the same place
	fonts.fontconfig.dpi = 192;
}
