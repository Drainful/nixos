{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (import ../modules/myemacs.nix { inherit pkgs; })
    pkgs.sbcl
    pkgs.lispPackages.quicklisp

    # rlwrap for sbcl when slime won't do.
    pkgs.rlwrap
  ];
  services.emacs.enable = true;
  services.emacs.defaultEditor = true;
}
