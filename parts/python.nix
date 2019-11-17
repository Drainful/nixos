{ config, pkgs, ... }:

{
  imports =
    [
    ];

  environment.systemPackages = with pkgs; [
	  # I use python as an application
    (python36.withPackages(ps: with ps; [
		  numpy

      # Python language server for development
			python-language-server
			pyls-isort
			pyls-black

			# For qutebrowser userscripts
			tldextract beautifulsoup4
			pyreadability pykeepass stem
		]))
  ];
}
