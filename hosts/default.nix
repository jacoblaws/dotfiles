{ self, inputs, ... }:
let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (import "${self}/system") nixos;

  user = "jvl";
  lib = inputs.nixpkgs.lib.extend (
    final: prev: (import "${self}/lib" final) // inputs.home-manager.lib
  );
  specialArgs = {
    inherit
      self
      inputs
      lib
      user
      ;
  };

  hmModule = system: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = specialArgs // {
        system = system;
      };
      users.${user} = ../home;
    };
  };
in
{
  flake.nixosConfigurations =
    let
      system = "x86_64-linux";
    in
    {
      desktop = nixosSystem {
        inherit specialArgs;
        modules = nixos ++ [
          ./desktop
          (hmModule system)
        ];
      };

      laptop = nixosSystem {
        inherit specialArgs;
        modules = nixos ++ [
          ./laptop
          (hmModule system)
        ];
      };
    };
}
