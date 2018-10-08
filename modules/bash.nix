{ config, pkgs, ... }:

{ 
  programs.bash.shellAliases = {
    md = "mkdir";
    e = "nvim";
  };

  # add necessary bash related modules
  environment.systemPackages = with pkgs; [
  ];
}
