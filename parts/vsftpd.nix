{ config, pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
	#   # telnet
	# 	# klibcShrunk # This one causes ls and mkdir to segfault in nixos-19.03. IDK what I even had it for in the first place.
  # ];

	services.vsftpd = {
		enable = true;
		anonymousUserHome = "/home/ftp/";
		anonymousUser = true;
	};
}
