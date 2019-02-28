
{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
	  telnet
		klibcShrunk
  ];

	services.vsftpd = {
		enable = true;
		anonymousUserHome = "/home/ftp/";
		anonymousUser = true;
	};

}
