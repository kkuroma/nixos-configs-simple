let
  keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcf33fgUY81ov0I6i+6ZJGGURkRwITQDDr3fgjlMid0 kuroma@zaphkiel"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINofwHa5GuqtIg7RGhFnr+2HrGncuwEK5EHlFEIE8gQU kuroma@raziel"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/m2DdSexkfNPVSlRzMxVW5N2EYLN7RC8PuycCNCh++ ismai@LAPTOP-69SE552N"
  ];
in
{
  services.openssh = {
    enable = true;
    openFirewall = false; # firewall.nix owns the port
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  users.users.root.openssh.authorizedKeys.keys = keys;
  users.users.user.openssh.authorizedKeys.keys = keys;
}
