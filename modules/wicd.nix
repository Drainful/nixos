{ config, pkgs, ... }:

{
  imports =
    [];
  networking = {
    wireless.enable = false;  # Disable in favour of wicd
    useDHCP = false;  # Disable in favour of wicd
    wicd.enable = true;
  };
}
