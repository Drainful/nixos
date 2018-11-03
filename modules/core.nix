{ config, pkgs, ... }:

{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
    ];

  environment.systemPackages = with pkgs; [
    st
    super-user-spark
    firefox
    git
    python gcc 
    curl wget
    networkmanager
    idea.idea-community
    neovim
    lsof
    fzf
  ];

  # nixpkgs.config = {
  #   firefox.enableAdobeFlash = true;
  # };
}
