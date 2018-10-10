{ config, pkgs, ... }:

{
  imports =
    [];

  # enable stumpwm
  environment.systemPackages = with pkgs; [
    stumpwm
  ];
}
