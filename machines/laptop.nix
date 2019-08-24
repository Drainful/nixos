{ config, pkgs, ... }:


{
	imports =
		[
			../parts/exwm.nix
			../parts/core.nix
			../parts/games.nix
			../parts/art.nix
			../parts/steam.nix
			../parts/nvidia_prime.nix
			../parts/emacs.nix
			../parts/vsftpd.nix
			../parts/bluetooth.nix
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

	# firewall
	# allow incoming connections from home LAN
	networking.firewall.extraCommands = "iptables -A INPUT -s 192.168.1.112/24 -j ACCEPT";
}
