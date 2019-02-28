{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp
    krita
    inkscape
    mypaint
    mypaint-brushes
  ];
}
