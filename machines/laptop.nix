{ config, pkgs, ... }:

{
  imports =
    [
		  ../modules/kde.nix
      ../modules/core.nix
      ../modules/art.nix
      ../modules/steam.nix
      ../modules/nvidia_prime.nix
      ../modules/emacs.nix
      ../modules/common-lisp.nix
			../modules/vsftpd.nix
    ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;

  networking.hostName = "nix"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # redshift
  services.redshift = {
    enable = true;
    # provider = "geoclue2";
    latitude = "43.16";
    longitude = "-77.61";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint
                                pkgs.canon-cups-ufr2 ];

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Enable sound.
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth.enable = true;
  };
  sound.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  users.mutableUsers = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adrian = {
    isNormalUser = true;
    name = "adrian";
    description = "Adrian Fullmer";
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
  };

  users.users.eelco = {
    isNormalUser = true;
    name = "eelco";
    description = "Eelco Dolstra";
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1001;
  };

  # environment.noXlibs = true;
	services.xserver.videoDrivers = ["modesetting"];
}
