let
  tailscalePorts = [ 22 ];
  localPorts = [ 22 ];
in
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = localPorts;
    interfaces.tailscale0.allowedTCPPorts = tailscalePorts;
  };
}
