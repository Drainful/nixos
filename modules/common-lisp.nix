{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Implementations
    sbcl
    ecl

    # Wraps the poor repl ui (when I don't want to use slime)
    rlwrap

    lispPackages.quicklisp

    # More recent version of asdf than sbcl ships with.
    asdf

		# i want to hack with readline stuff without a default.nix
		readline
  ];
}
