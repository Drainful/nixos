{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
    ];

  environment.systemPackages = with pkgs; [
    # bluetooth
    bluedevil
    bluez
  ];

  # enable stumpwm
  services.xserver.windowManager.stumpwm.enable = true;
}
