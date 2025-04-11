{ lib, ... }: let
  inherit (lib) mkOption types literalExpression;
in {
  options.theme = {
    name = mkOption {
      type = types.str;
      default = "";
      example = "everforestDark";
      description = ''
        The name of the color scheme palette to use
      '';
    };

    palette = mkOption {
      type = with types; attrsOf (submodule {
        options = {
          variant = mkOption {
            type = enum [ "dark" "light" ];
            default = "dark";
            description = ''
              Whether the color scheme is for dark or light mode
            '';
          };

          colors = mkOption {
            type = attrsOf str;
            default = {};
            example = literalExpression ''
              {
                fg = "ffffff";
                bg = "000000";
              }
            '';
            description = ''
              Attribute set of hex color strings
            '';
          };
        };
      });
    };
  };
}
