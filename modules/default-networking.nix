{ config, pkgs, ... }:

{
  imports =
    [];
  networking = {
    # wireless.enable = true;  
		networkmanager.enable = true;
    # useDHCP = true;
  };
}
