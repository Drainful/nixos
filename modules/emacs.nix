{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (import ../modules/myemacs.nix { inherit pkgs; })
    # tags server for emacs
    # cquery
  ];
  services.emacs.enable = true;
  services.emacs.defaultEditor = true;
}
