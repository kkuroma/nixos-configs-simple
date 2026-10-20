{ inputs, ... }:
{
  imports = [
    ./modules/boot.nix
    ./modules/packages.nix
    ./modules/ssh.nix
    ./modules/tailscale.nix
    ./modules/codiumserver.nix
    ./modules/firewall.nix
    ./modules/docker.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # passwords are "root" and "user", hashed with `mkpasswd --method=yescrypt`
  users.mutableUsers = false;
  users.users.root.hashedPassword = "$y$j9T$wr4CkqYW9JtJJIdbXUOzt1$JvTxYF.OETdAJpf9.c2Yw6aPGv7OUIwvhvVEBcuJaZ4";
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$y$j9T$g7gOVuNxDtgv8A97xuaOs/$bN5cXy1mF1GhlTV6aHGiQiMvOHM32QI7RIYXX7UVBw2";
    shell = "/run/current-system/sw/bin/zsh";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.user = {
      imports = [ ./home/zsh.nix ./home/packages.nix ];
      home.stateVersion = "25.11";
    };
  };

  system.stateVersion = "25.11";
}
