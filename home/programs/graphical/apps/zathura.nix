{ ... }: {
  programs.zathura = {
    enable = true;
    options = {
      window-title-basename = true;
      selection-clipboard = "clipboard";

      # everforest colorscheme
      notification-error-bg    = "#2d353b"; # bg0
      notification-error-fg    = "#e67e80"; # red
      notification-warning-bg  = "#2d353b"; # bg0
      notification-warning-fg  = "#369875"; # orange
      notification-bg          = "#2d353b"; # bg0
      notification-fg          = "#ac7080"; # green

      completion-bg            = "#343d44"; # bg1
      completion-fg            = "#d3c6aa"; # fg
      completion-group-bg      = "#3d484d"; # bg2
      completion-group-fg      = "#7a8478"; # gray0
      completion-highlight-bg  = "#7fbbb3"; # blue
      completion-highlight-fg  = "#3d484d"; # bg2

      index-bg                 = "#2d353b"; # bg0
      index-fg                 = "#d3c6aa"; # fg
      index-active-bg          = "#343f44"; # bg1
      index-active-fg          = "#dbbc7f"; # yellow

      inputbar-bg              = "#232a2e"; # bg_dim
      inputbar-fg              = "#d3c6aa"; # fg

      statusbar-bg             = "#232a2e"; # bg_dim
      statusbar-fg             = "#d3c6aa"; # Foreground

      highlight-color          = "#ac7080"; # green
      highlight-active-color   = "#dbbc7f"; # yellow

      default-bg               = "#2d353b"; # bg0
      default-fg               = "#d3c6aa"; # fg

      render-loading           = true;
      render-loading-fg        = "#2d353b"; # Background
      render-loading-bg        = "#d3c6aa"; # Foreground

      recolor-lightcolor       = "#2d353b"; # Background
      recolor-darkcolor        = "#d3c5aa"; # Foreground

      # startup options
      adjust-open = "width";
      recolor = true;
      recolor-keephue = true;
    };
  };
}
