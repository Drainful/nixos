{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (import ../parts/myemacs.nix { inherit pkgs; })
    # tags server for emacs
    # cquery
		# spellcheck
		aspell
		aspellDicts.en
  ];
	# since I use exwm, I don't need the emacs service
  # services.emacs.enable = true;
  # services.emacs.defaultEditor = true;
}
