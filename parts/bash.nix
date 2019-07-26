{ config, pkgs, ... }:

{ 
  programs.bash.shellAliases = {
    md = "mkdir";
    e = "nvim";
  };

  environment.systemPackages = with pkgs; [
  ];
}
