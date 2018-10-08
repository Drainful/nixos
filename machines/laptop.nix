{ config, pkgs, ... }:

{
  imports =
    [ ../modules/core.nix
      ../modules/art.nix

      ../modules/steam.nix
      ../modules/nvidia_prime.nix
    ];

  environment.systemPackages = [
    (import ../modules/emacs.nix { inherit pkgs; })
  ];
  services.emacs.enable = true;
  services.emacs.defaultEditor = true;

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;

  networking.hostName = "ipkcle_laptop"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;
  sound.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  users.mutableUsers = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adrian = {
    isNormalUser = true;
    name = "adrian";
    description = "Adrian Fullmer";
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
  };
}
