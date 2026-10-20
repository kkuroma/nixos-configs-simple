{ inputs, ... }:
{
  imports = [ "${inputs.vscodium-server}/modules/vscodium-server" ];
  services.vscodium-server.enable = true;
}
