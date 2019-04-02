{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Implementations
    sbcl
    ecl

    lispPackages.quicklisp

    # More recent version of asdf than sbcl ships with.
    asdf

		# i want to hack with readline stuff without a default.nix
		readline
  ];
}
