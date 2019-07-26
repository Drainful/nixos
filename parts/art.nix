{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp

    inkscape

    mypaint
    mypaint-brushes

    libwacom
    xf86_input_wacom

    blender

    # nixos stable's version of krita crashes when I use my pen
    krita

    # videogames are art
    godot
  ];
}
