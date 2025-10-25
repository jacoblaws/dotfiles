{ self, ... }: {
  imports = [ self.nixosModules.theme ./everforest.nix ];
  currentTheme = "everforest";
}

