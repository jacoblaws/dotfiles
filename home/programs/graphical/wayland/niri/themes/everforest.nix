{ osConfig, ... }:
let
  inherit (osConfig) currentTheme theme;
  inherit (theme.${currentTheme}) dark light;
in {
  xdg.configFile."noctalia/themes/everforest-dark.json".text = # json
    ''
      {
        "mPrimary": "#${dark.fg}",
        "mOnPrimary": "#${dark.bgd}",
        "mSecondary": "#${dark.fg}",
        "mOnSecondary": "#${dark.bgd}",
        "mTertiary": "#${dark.grey2}",
        "mOnTertiary": "#${dark.bgd}",
        "mError": "#${dark.red}",
        "mOnError": "#${dark.bgd}",
        "mSurface": "#${dark.bgd}",
        "mOnSurface": "#${dark.grey1}",
        "mSurfaceVariant": "#${dark.bg0}",
        "mOnSurfaceVariant": "#${dark.fg}",
        "mOutline": "#${dark.fg}",
        "mShadow": "#${dark.bg3}",
        "mHover": "#${dark.grey2}",
        "mOnHover": "#${dark.bgd}"
      }
    '';

  xdg.configFile."noctalia/themes/everforest-light.json".text = # json
    ''
      {
        "mPrimary": "#434F55",
        "mOnPrimary": "#D3C6AA",
        "mSecondary": "#232a2e",
        "mOnSecondary": "#D3C6AA",
        "mTertiary": "#333c43",
        "mOnTertiary": "#9DA9A0",
        "mError": "#E66868",
        "mOnError": "#9DA9A0",
        "mSurface": "#9DA9A0",
        "mOnSurface": "#232A2E",
        "mSurfaceVariant": "#BEC5B2",
        "mOnSurfaceVariant": "#333C43",
        "mOutline": "#232A2E",
        "mShadow": "#ECF5ED",
        "mHover": "#333c43",
        "mOnHover": "#9DA9A0"
      }
    '';
}
