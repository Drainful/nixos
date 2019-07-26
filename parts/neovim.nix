{ config, pkgs, ... }:

{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      neovim = pkgs.neovim.override {
        configure = {
          # customRC = builtins.readFile ./neovim/rc.vim;
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [
            # fast file searching with fzf
            fzf-vim

            ];
            opt = [];
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];
}
