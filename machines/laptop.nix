{ config, pkgs, ... }:

{
  imports =
    [
		  ../modules/exwm.nix
      ../modules/core.nix
      ../modules/art.nix
      ../modules/steam.nix
      ../modules/nvidia_prime.nix
      ../modules/emacs.nix
			../modules/vsftpd.nix
			../modules/bluetooth.nix
			# ../modules/hidpi-cursor.nix
    ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;

  networking = {
    hostName = "nixos"; # Define your hostname.
  };

  # Select internationalisation properties.
  i18n = {
	  # big font for visibility on 4k monitor
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

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

	# Sound
  hardware.pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
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
    extraGroups = [ "wheel" "networkmanager" "video" ];
    uid = 1000;
  };

	# services.xserver.videoDrivers = ["modesetting"];

  # lightdm cursor size
	environment.variables.XCURSOR_SIZE="64";
}
