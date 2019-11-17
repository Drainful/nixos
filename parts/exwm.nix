{ config, lib, pkgs, ... }:

{
  imports = [
	  ./x11.nix
	  ./guistuff.nix
	  ./emacs.nix
	  ./sans-desktop-environment.nix
  ];

	environment.systemPackages = [ pkgs.lightlocker ];
	services.xserver.windowManager.exwm = {
		enable = true;
		enableDefaultConfig = false;
	};

	# # Compositor
	
	# services.compton = {
	# 	enable = false;
	# 	fade = false;
	# 	shadow = false;
	# 	vSync = "opengl-swc";
	# 	backend = "glx";
	# 	# 		settings = ''

	# 	# paint-on-overlay = true;
	# 	# glx-no-stencil = true;
	# 	# unredir-if-possible = true;

	# 	# '';
	# };

	# services.xserver = {
	# 	displayManager.lightdm.enable = true;

	# 	# Give EXWM permission to control the session. who knows if this is necessary
	#   # displayManager.sessionCommands = "${pkgs.xorg.xhost}/bin/xhost + SI:localuser:$USER";

  # 	windowManager.session = lib.singleton {
  #     name = "exwm";

  #     # I gave up and used .Xsession. This doesn't seem to work.
	# 		# start = '''';

  #     # start = ''
	# 		#   ${myemacs}/bin/emacs -l exwm-enable
  #     # '';

  #     # start = ''
	# 		#   ${myemacs}/bin/emacs -f exwm-enable
	# 		# 	waitPID=$!
  #     # '';

  #     # start = ''
	# 		#   ${myemacs}/bin/emacs --daemon -f exwm-enable
	# 	  #   ${myemacs}/bin/emacsclient --create-frame
  #     # '';

  #     # start = ''
	# 		#   ${myemacs}/bin/emacs --daemon=exwm -f exwm-enable
	# 	  #   ${myemacs}/bin/emacsclient --create-frame --socket-name=exwm
  #     # '';

  #     start = ''
	# 		  emacs --daemon=exwm -f exwm-enable
	# 	    emacsclient --create-frame --socket-name=exwm
  #     '';
			
	# 	};
	# };
}
