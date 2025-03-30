{ pkgs, lib, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = let
        tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
        hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
        awesome-session = "${pkgs.awesome}/share/xsessions";
        tuigreet-options = [
          "--time"
          "--remember"
          "--remember-session"
          "--sessions ${hyprland-session}"
          "--xsessions ${awesome-session}"
          "--theme 'text=white'"
        ];
        flags = lib.concatStringsSep " " tuigreet-options;
      in {
        command = "${tuigreet} ${flags}";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    type = "idle";
    StandardInput = "tty";
    StandardOuput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
