{ config, pkgs, ... }:

let
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
	programs.java.enable = true;
	
	environment.systemPackages = with pkgs; [
    (my_unstable.steam.override { withJava = true; nativeOnly = true; }).run
  ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
}
