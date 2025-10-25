{ self, inputs, ... }:
let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (import "${self}/system") nixos;

  user = "jvl";
  specialArgs = { inherit self inputs user; };

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
