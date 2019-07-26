{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SBCL is used as an application, not just a project specific tool.
    sbcl
  ];
}
