{ self, inputs, ... }:
let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (import "${self}/system") nixos;

  user = "jvl";
  lib = inputs.nixpkgs.lib.extend
    (final: prev: (import "${self}/lib" final) // inputs.home-manager.lib);
  specialArgs = { inherit self inputs lib user; };

  hmModule = host: system: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = specialArgs // { system = system; };
      users.${user}.imports = (import "${self}/home/profiles").${host};
    };
  };
in {
  flake.nixosConfigurations = let system = "x86_64-linux";
  in {
    desktop = nixosSystem {
      inherit specialArgs;
      modules = nixos ++ [ ./desktop (hmModule "desktop" system) ];
    };

    laptop = nixosSystem {
      inherit specialArgs;
      modules = nixos ++ [ ./laptop (hmModule "laptop" system) ];
    };
  };
}
