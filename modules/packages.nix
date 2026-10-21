{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [ git vim ghostty.terminfo ];
}
