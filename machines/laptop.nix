{ config, pkgs, ... }:


{
	imports =
		[
      # ../parts/kde.nix
			../parts/exwm.nix
			../parts/core.nix
			../parts/games.nix
			../parts/art.nix
			../parts/steam.nix
			# ../parts/bumblebee.nix
			../parts/nvidia_disabled.nix
			# ../parts/nvidia_static.nix
			../parts/emacs.nix
			../parts/vsftpd.nix
			../parts/bluetooth.nix
			../parts/virtualisation.nix
			../parts/ios.nix
		];

	nixpkgs.config.allowUnfreePredicate = with builtins;
		(pkg: elem (pkg.pname or (parseDrvName pkg.name).name) [
			"unrar"
			"steam"
			"steam-original"
			"steam-runtime"

			"nvidia-x11"
			"nvidia-settings"
			"nvidia-persistenced"
		]);

  environment.systemPackages = with pkgs; [
		vulkan-loader
  ];

	# Use the systemd-boot EFI boot loader
	boot.loader.systemd-boot.enable = true;

	networking = {
		enableIPv6 = false;
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

	location = {
		latitude = 42.04;
		longitude = 87.68;
	};

	# redshift
	services.redshift.enable = true;

	# Enable CUPS to print documents.
	services.printing.enable = true;
	services.printing.drivers = [ pkgs.gutenprint
																# pkgs.canon-cups-ufr2
															];

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
	services.xserver.libinput.tapping = true;
	services.xserver.libinput.middleEmulation = true;
	services.xserver.libinput.naturalScrolling = false;

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
