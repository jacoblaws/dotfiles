{ osConfig, lib, ... }:
let
  inherit (osConfig) themes;

  genThemeFiles =
    themes: spec:
    let
      themeVals = lib.attrValues themes;
      paths = map (theme: "zed/themes/${theme.name}.json") themeVals;
      specs = map (theme: spec theme) themeVals;
      toAttrs = path: spec: lib.setAttrByPath [ path "text" ] spec;
      zipped = lib.zipListsWith toAttrs paths specs;
    in
    {
      xdg.configFile = lib.mergeAttrsList zipped;
    };

  spec =
    theme:
    let
      dark = theme.dark;
    in
    ''
      {
        "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
        "name": "${theme.name}",
        "author": "",
        "themes": [
          {
            "name": "${theme.name} Dark",
            "appearance": "dark",
            "style": {
              "background": "#${dark.bgd}",
              "surface.background": "#${dark.bgd}",
              "elevated_surface.background": "#${dark.bgd}",

              "panel.background": "#${dark.bgd}",
              "panel.overlay_background": "#${dark.bgd}",
              "panel.overlay_hover": "#${dark.bg0}",
              "panel.focused_border": "#00000000",
              "panel.indent_guide": null,
              "panel.indent_guide_active": null,
              "panel.indent_guide_hover": null,
              "pane.focused_border": "#00000000",

              "border": "#00000000",
              "border.variant": "#${dark.bg0}",
              "border.focused": "#00000000",
              "border.selected": "#00000000",
              "border.transparent": "#00000000",
              "border.disabled": "#00000000",

              "text": "#${dark.fg}",
              "text.accent": "#${dark.a1}",
              "text.disabled": "#${dark.bg5}",
              "text.muted": "#${dark.grey0}",
              "text.placeholder": "#${dark.grey0}",

              "icon": "#${dark.fg}",
              "icon.accent": "#${dark.a1}",
              "icon.disabled": "#${dark.bg5}",
              "icon.muted": "#${dark.grey0}",
              "icon.placeholder": "#${dark.grey0}",

              "editor.foreground": "#${dark.fg}",
              "editor.background": "#${dark.bg0}",
              "editor.gutter.background": "#${dark.bg0}",
              "editor.subheader.background": "#${dark.bgd}",
              "editor.active_line.background": "#00000000",
              "editor.highlighted_line.background": "#00000000",
              "editor.line_number": "#${dark.bg5}",
              "editor.active_line_number": "#${dark.grey1}",
              "editor.hover_line_number": "#${dark.a1}",
              "editor.invisible": "#${dark.grey0}",
              "editor.wrap_guide": null,
              "editor.active_wrap_guide": null,
              "editor.indent_guide": null,
              "editor.indent_guide_active": null,

              "editor.document_highlight.read_background": "#00000000",
              "editor.document_highlight.write_background": "#00000000",
              "editor.document_highlight.bracket_background": "#00000000",
              "search.match_background": "#${dark.magenta}70",

              "status_bar.background": "#${dark.bgd}",
              "title_bar.background": "#${dark.bgd}",
              "title_bar.inactive_background": "#${dark.bgd}",
              "toolbar.background": "#${dark.bg0}",

              "element.background": "#${dark.bg0}",
              "element.active": "#${dark.bg0}",
              "element.disabled": "#${dark.bg4}",
              "element.hover": "#${dark.bg0}",
              "element.selected": "#${dark.bg0}",

              "ghost_element.background": "#00000000",
              "ghost_element.hover": "#${dark.bg0}",
              "ghost_element.active": "#${dark.bg0}",
              "ghost_element.selected": "#${dark.bg0}",
              "ghost_element.disabled": "#${dark.bg4}",

              "drop_target.background": "#${dark.grey0}40",
              "drop_target.border": "#00000000",

              "tab_bar.background": "#${dark.bgd}",
              "tab.active_background": "#${dark.bg0}",
              "tab.inactive_background": "#${dark.bgd}",

              "scrollbar.thumb.background": "#${dark.bg4}bf",
              "scrollbar.thumb.hover_background": "#${dark.bg4}",
              "scrollbar.thumb.active_background": "#${dark.bg4}",
              "scrollbar.thumb.border": "#00000000",
              "scrollbar.track.background": "#00000000",
              "scrollbar.track.border": "#00000000",

              "minimap.thumb.background": "#${dark.bg4}bf",
              "minimap.thumb.hover_background": "#${dark.bg4}",
              "minimap.thumb.active_background": "#${dark.bg4}",
              "minimap.track.background": "#00000000",

              "hint": "#${dark.blue}",
              "hint.background": "#${dark.bgb}",
              "hint.border": "#00000000",

              "info": "#${dark.blue}",
              "info.background": "#${dark.bgb}",
              "info.border": "#00000000",

              "success": "#${dark.green}",
              "success.background": "#${dark.bgg}",
              "success.border": "#00000000",

              "warning": "#${dark.yellow}",
              "warning.background": "#${dark.bgy}",
              "warning.border": "#00000000",

              "error": "#${dark.red}",
              "error.background": "#${dark.bgr}",
              "error.border": "#00000000",

              "created": "#${dark.green}",
              "created.background": "#${dark.bgg}",
              "created.border": "#00000000",

              "modified": "#${dark.blue}",
              "modified.background": "#${dark.bgb}",
              "modified.border": "#00000000",

              "deleted": "#${dark.red}",
              "deleted.background": "#${dark.bgr}",
              "deleted.border": "#00000000",

              "conflict": "#${dark.yellow}",
              "conflict.background": "#${dark.bgy}",
              "conflict.border": "#00000000",

              "renamed": "#${dark.magenta}",
              "renamed.background": "#${dark.bgm}",
              "renamed.border": "#00000000",

              "hidden": "#${dark.bg5}",
              "hidden.background": "#${dark.bgd}",
              "hidden.border": "#00000000",

              "ignored": "#${dark.bg5}",
              "ignored.background": "#${dark.bgd}",
              "ignored.border": "#00000000",

              "predictive": "#${dark.bg5}",
              "predictive.background": "#${dark.bgd}",
              "predictive.border": "#00000000",

              "unreachable": "#${dark.magenta}",
              "unreachable.background": "#${dark.bgm}",
              "unreachable.border": "#00000000",

              "version_control.added": "#${dark.green}",
              "version_control.deleted": "#${dark.red}",
              "version_control.modified": "#${dark.blue}",
              "version_control.renamed": "#${dark.magenta}",
              "version_control.conflict": "#${dark.orange}",
              "version_control.ignored": "#${dark.bg5}",
              "version_control.word_added": "#${dark.green}80",
              "version_control.word_deleted": "#${dark.red}80",
              "version_control.conflict_marker.ours": "#${dark.orange}",
              "version_control.conflict_marker.theirs": "#${dark.yellow}",

              "terminal.background": "#${dark.bg0}",
              "terminal.foreground": "#${dark.fg}",
              "terminal.ansi.black": "#${dark.bg0}",
              "terminal.ansi.bright_black": "#${dark.bg1}",
              "terminal.ansi.dim_black": "#${dark.bgd}",
              "terminal.ansi.red": "#${dark.red}",
              "terminal.ansi.bright_red": "#${dark.red}",
              "terminal.ansi.dim_red": "#${dark.bgr}",
              "terminal.ansi.green": "#${dark.green}",
              "terminal.ansi.bright_green": "#${dark.green}",
              "terminal.ansi.dim_green": "#${dark.bgg}",
              "terminal.ansi.yellow": "#${dark.yellow}",
              "terminal.ansi.bright_yellow": "#${dark.yellow}",
              "terminal.ansi.dim_yellow": "#${dark.bgy}",
              "terminal.ansi.blue": "#${dark.blue}",
              "terminal.ansi.bright_blue": "#${dark.blue}",
              "terminal.ansi.dim_blue": "#${dark.bgb}",
              "terminal.ansi.magenta": "#${dark.magenta}",
              "terminal.ansi.bright_magenta": "#${dark.magenta}",
              "terminal.ansi.dim_magenta": "#${dark.bgm}",
              "terminal.ansi.cyan": "#${dark.cyan}",
              "terminal.ansi.bright_cyan": "#${dark.cyan}",
              "terminal.ansi.dim_cyan": "#${dark.cyan}",
              "terminal.ansi.white": "#${dark.fg}",
              "terminal.ansi.bright_white": "#${dark.fg}",
              "terminal.ansi.dim_white": "#${dark.fg}",

              "players": [
                {
                  "cursor": "#${dark.fg}",
                  "background": "#00000000",
                  "selection": "#${dark.bgv}
                }
              ],

              "syntax": {
                "attribute": {
                  "color": "#${dark.yellow}",
                  "font_style": null,
                  "font_weight": null
                },
                "boolean": {
                  "color": "#${dark.magenta}",
                  "font_style": null,
                  "font_weight": null
                },
                "comment": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "comment.doc": {
                  "color": "#${dark.grey2}",
                  "font_style": null,
                  "font_weight": null
                },
                "constant": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "constructor": {
                  "color": "#${dark.green}",
                  "font_style": null,
                  "font_weight": null
                },
                "embedded": {
                  "color": "#${dark.green}",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis": {
                  "color": "#${dark.cyan}",
                  "font_style": "italic",
                  "font_weight": null
                },
                "emphasis.strong": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": 700
                },
                "enum": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": null
                },
                "function": {
                  "color": "#${dark.green}",
                  "font_style": null,
                  "font_weight": null
                },
                "hint": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "keyword": {
                  "color": "#${dark.red}",
                  "font_style": null,
                  "font_weight": null
                },
                "label": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": null
                },
                "link_text": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "link_uri": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": null
                },
                "namespace": {
                  "color": "#${dark.yellow}",
                  "font_style": null,
                  "font_weight": null
                },
                "number": {
                  "color": "#${dark.magenta}",
                  "font_style": null,
                  "font_weight": null
                },
                "operator": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": null
                },
                "predictive": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "preproc": {
                  "color": "#${dark.magenta}",
                  "font_style": null,
                  "font_weight": null
                },
                "primary": {
                  "color": "#${dark.fg}",
                  "font_style": null,
                  "font_weight": null
                },
                "property": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation.bracket": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation.delimiter": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation.list_marker": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation.markup": {
                  "color": "#${dark.grey1}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctutation.special": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "selector": {
                  "color": "#${dark.blue}",
                  "font_style": null,
                  "font_weight": null
                },
                "selector.pseudo": {
                  "color": "#${dark.magenta}",
                  "font_style": null,
                  "font_weight": null
                },
                "string": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.escape": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.regex": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special": {
                  "color": "#${dark.yellow}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special.symbol": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "tag": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": null
                },
                "text.literal": {
                  "color": "#${dark.cyan}",
                  "font_style": null,
                  "font_weight": null
                },
                "title": {
                  "color": "#${dark.orange}",
                  "font_style": null,
                  "font_weight": 700
                },
                "type": {
                  "color": "#${dark.yellow}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable": {
                  "color": "#${dark.fg}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable.special": {
                  "color": "#${dark.magenta}",
                  "font_style": null,
                  "font_weight": null
                },
                "variant": {
                  "color": "#${dark.fg}",
                  "font_style": null,
                  "font_weight": null
                }
              }
            }
          },
          {
            "name": "Everforest Light",
            "appearance": "light",
            "style": {}
          }
        ]
      }
    '';
in
genThemeFiles themes spec
