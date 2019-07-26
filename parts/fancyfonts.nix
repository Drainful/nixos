{ config, pkgs, ... }:

{
fonts = {
enableFontDir = true;
fonts = with pkgs; [
    dejavu_fonts
		google-fonts
		gyre-fonts
		inriafonts
		liberation_ttf
		noto-fonts
		roboto
		textfonts
  ];
};
}
