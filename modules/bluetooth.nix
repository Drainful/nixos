{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
    bluedevil
    bluez
  ];

  hardware.bluetooth.enable = true;
}
