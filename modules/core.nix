{ config, pkgs, ... }:

{
  imports =
    [ # ./bash.nix
      # ./neovim.nix
    ];

  environment.systemPackages = with pkgs; [
    super-user-spark
    firefox
    git
    python ruby nodejs gcc 
    rustc rustfmt cargo
    curl wget
    networkmanager
    idea.idea-community
    neovim
    lsof
    fzf
  ];
}
