{ config, pkgs, ... }:

{
  imports = [];

  environment.systemPackages = with pkgs; [
    mysql
  ];

  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      dataDir = "/var/db/mysql/";
    };

    mysqlBackup = {
      enable = true;
      user = "root";
      databases = []; # put databases to back up here
    };
  };

  systemd.services.mysql.serviceConfig = {
    Restart = "on-failure";
    RestartSec = "10s";
  };
}
