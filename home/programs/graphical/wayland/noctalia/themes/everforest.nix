{ osConfig, ... }:
let inherit (osConfig.themes.everforest) dark light;
in {
  xdg.configFile."noctalia/colorschemes/everforest/everforest.json".text = # json
    ''
      {
        "dark": {
          "mSurface": "#${dark.bgd}",
          "mOnSurface": "#${dark.fg}",
          "mSurfaceVariant": "#${dark.bg0}",
          "mOnSurfaceVariant": "#${dark.grey1}",

          "mOutline": "#${dark.grey0}",
          "mShadow": "#${dark.bg3}",
          "mHover": "#${dark.bg2}",
          "mOnHover": "#${dark.yellow}",

          "mPrimary": "#${dark.fg}",
          "mOnPrimary": "#${dark.bgd}",
          "mSecondary": "#${dark.grey0}",
          "mOnSecondary": "#${dark.bgd}",
          "mTertiary": "#${dark.green}",
          "mOnTertiary": "#${dark.bgd}",

          "mError": "#${dark.red}",
          "mOnError": "#${dark.bgd}"
        },

        "light": {
          "mSurface": "#${light.bgd}",
          "mOnSurface": "#${dark.bg0}",
          "mSurfaceVariant": "#${light.bg0}",
          "mOnSurfaceVariant": "#${dark.bg5}",

          "mOutline": "#${light.grey1}",
          "mShadow": "#${light.bg3}",
          "mHover": "#${dark.bg5}",
          "mOnHover": "#${light.bgd}",

          "mPrimary": "#${dark.bg0}",
          "mOnPrimary": "#${light.bgd}",
          "mSecondary": "#${dark.bg5}",
          "mOnSecondary": "#${light.bgd}",
          "mTertiary": "#${light.green}",
          "mOnTertiary": "#${light.bgd}",

          "mError": "#${light.red}",
          "mOnError": "#${light.bgd}"
        }
      }
    '';
}
