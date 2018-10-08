{config, pkgs, ... }:

{
  hardware.bumblebee = {
    enable = true;
    group = "video";
    connectDisplay = true;
  };
}
