{ config, pkgs, ... }:

{
  imports =
    [
		./direnv.nix
    ];

  environment.systemPackages = with pkgs; [
	
  ];
}
