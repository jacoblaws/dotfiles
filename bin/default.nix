{ pkgs, ... }:
let
  theme = pkgs.writers.writeHaskellBin "theme" {
    libraries = with pkgs.haskell.packages.ghc912; [ optparse-applicative ];
    ghc = pkgs.haskell.packages.ghc912.ghc;
  } (builtins.readFile ./theme.hs);
in
{
  environment.systemPackages = [ theme ];
}
