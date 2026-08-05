{ inputs, ... }: {
  flake.nixosModules = {
    hjem = inputs.hjem.nixosModules.default;
    musnix = inputs.musnix.nixosModules.default;
  };
}
