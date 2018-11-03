{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
    ];

  environment.systemPackages = with pkgs; [
    networkmanager_dmenu
    xorg.xbacklight
    #dmenu
    xfce.thunar
  ];

  # enable stumpwm
  services.xserver.windowManager.stumpwm.enable = true;
}
