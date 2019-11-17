{ pkgs ? import <nixpkgs> {} }:
let
  myEmacs = pkgs.emacs.override { inherit (pkgs) imagemagick; };
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    # use-package
  ]))
