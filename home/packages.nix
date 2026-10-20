{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    ripgrep
    fzf
    btop
    yazi
    zoxide
    zellij
    git
    wget
    curl
    python3
    uv
    neovim
  ];
}
