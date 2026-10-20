{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.limine.enable = true;
  boot.loader.limine.maxGenerations = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };

  # hourly btrfs snapshots of /home
  services.snapper.snapshotInterval = "hourly";
  services.snapper.configs.home = {
    SUBVOLUME = "/home";
    ALLOW_USERS = [ "user" ];
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
    TIMELINE_MIN_AGE = 3600;
    TIMELINE_LIMIT_HOURLY = "8";
    TIMELINE_LIMIT_DAILY = "0";
    TIMELINE_LIMIT_WEEKLY = "1";
    TIMELINE_LIMIT_MONTHLY = "0";
    TIMELINE_LIMIT_YEARLY = "0";
  };
}
