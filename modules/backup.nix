{ config, pkgs, ... }:

{
  imports = [];

  environment.systemPackages = with pkgs; [
    # backup through google drive
    gdrive

    # sync files
    rsync
  ];

  # Thumbdrive sync systemd service
  systemd.user.services.usb-drive-sync = {
    description = "Sync contents of USB drive to home directory when mounted";
    unitConfig = {
      Requires = "run-media-adrian-AF\x2dBACKUP.mount";
      After = "run-media-adrian-AF\x2dBACKUP.mount"
    }
    serviceConfig = {
      ExecStart = ""
    }
    wantedBy = [ "default.target" ]
  };
}
