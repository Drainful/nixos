{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
  my_unstable = import /home/adrian/code/nixpkgs { };
in 
{
  environment.systemPackages = with pkgs; [
    (import ../parts/myemacs.nix { inherit pkgs; })
    # tags server for emacs
    # cquery
		# spellcheck
		# emacs
		aspell
		aspellDicts.en

		# for images
		imagemagick
		fbida
		exiftool

		# for emms stream info
		mplayer

		# for dired-avfs
		avfs
  ];
	# since I use exwm, I don't need the emacs service
  # services.emacs.enable = true;
  # services.emacs.defaultEditor = true;
}
