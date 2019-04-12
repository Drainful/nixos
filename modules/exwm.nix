{ config, lib, pkgs, ... }:

let myemacs = import ./myemacs.nix { inherit pkgs; };
in {
  imports = [
	  ./x11.nix
	  ./guistuff.nix
	  ./emacs.nix
	  ./sans-desktop-environment.nix
  ];

	# REMEMBER https://www.reddit.com/r/NixOS/comments/8ghg4f/exwm_problem/
  # AND https://github.com/tazjin/nixos-config/blob/7c673cd0d053e7231bde40aba826a9cd779845a8/desktop.nix#L16-L17
	environment.systemPackages = [ myemacs pkgs.lightlocker ];
	services.xserver = {
	  displayManager.lightdm.enable = true;

		# Give EXWM permission to control the session. who knows if this is necessary
	  displayManager.sessionCommands = "${pkgs.xorg.xhost}/bin/xhost + SI:localuser:$USER";

  	windowManager.session = lib.singleton {
      name = "exwm";

      # I gave up and used .Xsession. This doesn't seem to work.
			start = '''';

      # start = ''
			#   ${myemacs}/bin/emacs -f exwm-enable
			# 	waitPID=$!
      # '';

      # start = ''
			#   ${myemacs}/bin/emacs --daemon=exwm -f exwm-enable
		  #   ${myemacs}/bin/emacsclient --create-frame --socket-name=exwm
      # '';

      # start = ''
			#   emacs --daemon=exwm -f exwm-enable
		  #   emacsclient --create-frame --socket-name=exwm
      # '';
		};
	};
}
