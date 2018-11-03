{ config, pkgs, ... }:

{
  imports =
    [ ./x11.nix
    ];

  environment.systemPackages = with pkgs; [
    ark
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
