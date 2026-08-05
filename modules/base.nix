{ lib, ... }: {
  options.nixos = lib.mkOption {
    type = lib.types.deferredMOdule;
  };

  options.hosts = lib.mkOption {
    type = lib.types.listOf (
      lib.types.submodule {
        options = {
          user = lib.mkOption {
            type = lib.types.str;
            default = "";
          };

          cfgPath = lib.mkOption {
            type = lib.types.str;
            default = "";
          };
        };
      }
    );

    default = { };
    description = "System hosts";
  };
}
