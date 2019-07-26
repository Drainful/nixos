{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
			./guistuff.nix
    ];

  environment.systemPackages = with pkgs; [
    # bluetooth
    bluedevil
    bluez
  ];

  # Enable the gnome Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
}
