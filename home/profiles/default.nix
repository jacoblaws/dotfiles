let linux = [ ./linux.nix ../programs ../services ];
in {
  desktop = linux ++ [ ./desktop ];
  laptop = linux ++ [ ./laptop ];
}
