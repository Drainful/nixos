{ config, pkgs, ... }:

let
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  environment.systemPackages = with pkgs; [
    gimp

    inkscape

    mypaint
    mypaint-brushes

    libwacom
    xf86_input_wacom

    my_unstable.blender

    # nixos stable's version of krita crashes when I use my pen
    krita

    # videogames are art
    my_unstable.godot
  ];
}
