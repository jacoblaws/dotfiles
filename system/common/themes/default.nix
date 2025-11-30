{ self, ... }: {
  imports = [ self.nixosModules.themes ./everforest.nix ];
  defaultTheme = "everforest";
}

