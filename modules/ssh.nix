let
  keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcf33fgUY81ov0I6i+6ZJGGURkRwITQDDr3fgjlMid0 kuroma@zaphkiel"
  ];
in
{
  services.openssh = {
    enable = true;
    openFirewall = false; # firewall.nix owns the port
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  users.users.root.openssh.authorizedKeys.keys = keys;
  users.users.user.openssh.authorizedKeys.keys = keys;
}
