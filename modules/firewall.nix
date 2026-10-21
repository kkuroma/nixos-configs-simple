let
  tailscalePorts = [ 22 ];
  localPorts = [ ];
in
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = localPorts;
    interfaces.tailscale0.allowedTCPPorts = tailscalePorts;
  };
}
