{ self, inputs, ... }: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    inherit (import "${self}/system") desktop laptop;

    importHome = import "${self}/home/profiles";
    specialArgs = {
      inherit self inputs;
      system = "x86_64-linux";
    };
  in {
    desktop = nixosSystem {
      inherit specialArgs;
      modules = desktop ++ [
        ./desktop
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.desktop;
          };
        }
        self.nixosModules.theme
      ];
    };

    laptop = nixosSystem {
      inherit specialArgs;
      modules = laptop ++ [
        ./laptop
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.laptop;
          };
        }
        self.nixosModules.theme
      ];
    };
  };
}
