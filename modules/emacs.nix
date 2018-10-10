{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (import ../modules/myemacs.nix { inherit pkgs; })
    pkgs.sbcl
  ];
  services.emacs.enable = true;
  services.emacs.defaultEditor = true;
}
