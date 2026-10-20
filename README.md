# Simple nixos configs

Very simple nixos configs

## Installation

Clone this repo. Set the disk in `disko.nix` from `ls -l /dev/disk/by-id`, then run the commands below from repo root.

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disko.nix
sudo nixos-install --flake .#nixos
```

## Post-installation

Git clone this repo into `~/nixos-configs-simple` on the installed system, make edits to the repo, then run `nix-rebuild`
