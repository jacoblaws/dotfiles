{ lib, ... }:
let inherit (lib) mkOption types literalExpression;
in {
  options.defaultTheme = mkOption {
    type = types.str;
    default = "everforest";
    description = ''
      Name of the default system colorscheme
    '';
  };

  options.themes = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        dark = mkOption {
          type = types.attrsOf types.str;
          default = { };
          example = literalExpression ''
            {
              fg = "ffffff";
              bg = "000000";
            }
          '';
        };

        light = mkOption {
          type = types.attrsOf types.str;
          default = { };
          example = literalExpression ''
            {
              fg = "000000";
              bg = "ffffff";
            }
          '';
        };
      };
    });

    description = ''
      Colorscheme colors separated into light and dark palettes
    '';
    example = ''
      everforest = {
        dark = {
          fg = "ffffff";
          bg = "000000";
        };
        light = {
          fg = "000000";
          bg = "ffffff";
        };
      };
    '';
  };
}
