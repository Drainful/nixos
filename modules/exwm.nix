
{ config, lib, pkgs, ... }:

let myemacs = import ./myemacs.nix { inherit pkgs; };
in {
  imports =
    [ ./x11.nix
			./guistuff.nix
			./emacs.nix
			./sans-desktop-environment.nix
    ];

	# FROM https://www.reddit.com/r/NixOS/comments/8ghg4f/exwm_problem/
  # AND FROM https://github.com/tazjin/nixos-config/blob/7c673cd0d053e7231bde40aba826a9cd779845a8/desktop.nix#L16-L17
	services.xserver = {
	  displayManager.lightdm.enable = true;
	  displayManager.sessionCommands = "${pkgs.xorg.xhost}/bin/xhost + SI:localuser:$USER";
  	desktopManager = {
      default = "emacs";
    	session = [ {
      	manage = "desktop";
      	name = "emacs";
        # ${myemacs}/bin/emacs &
      	start = ''
					emacsclient --create-frame &
        	waitPID=$!
      	'';
    	} ];
		};
  };
	# 	windowManager.session = lib.singleton {
  #     name = "exwm";
	# 		# doesn't execute? so i put it in ~/.xsession

	# 		# export _JAVA_AWT_WM_NONREPARENTING=1
	# 		# watch date | dzen2 -dock -p &
	# 		# ${myemacs}/bin/emacs --daemon=exwm -f exwm-enable --eval (shell-command "${myemacs}/bin/emacsclient --sock=exwm -c")
	# 		# export _JAVA_AWT_WM_NONREPARENTING=1
	# 		# watch date | dzen2 -dock -p &
	# 		# exec dbus-launch --exit-with-session emacs
	# 		# ${myemacs}/bin/emacsclient --create-frame
	# 		start = ''
 	# 		'';
	# 	};
	# };
}
