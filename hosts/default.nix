{ self, inputs, ... }: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    importHome = import "${self}/home/profiles";
    specialArgs = {
      inherit self inputs;
      system = "x86_64-linux";
    };
  in {
    desktop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./desktop
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.desktop;
          };
        }
      ];
    };

    laptop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./laptop
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.laptop;
          };
        }
      ];
    };
  };
}
