let
  core = [
    ../.
    ../services
    ../programs
  ];
in {
  desktop = core ++ [ ./desktop ];
  laptop = core ++ [ ./laptop ];
}
