{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp
    krita
    mypaint
    mypaint-brushes
  ];
}
