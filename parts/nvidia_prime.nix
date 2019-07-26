{ config, pkgs, pkgs_i686, ... }:

{
  # disble card with bbswitch by default
  hardware.nvidiaOptimus.disable = true;
  # install nvidia drivers in addition to intel one
  # hardware.opengl.extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
  # hardware.opengl.extraPackages32 = [ pkgs_i686.linuxPackages.nvidia_x11.out ];
}

