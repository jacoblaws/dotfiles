{
  flake.nixosModules.homeBase =
    {
      lib,
      pkgs,
      user,
      ...
    }:
    {
      hjem.clobberByDefault = true;
      hjem.users.${user} = {
        packages = with pkgs; [
          # GUI applications
          anki
          # aseprite
          blender
          brave
          calibre
          decibels
          discord
          drawio
          foliate
          gapless
          gnome-calculator
          godot
          libreoffice
          loupe
          mangohud
          mission-center
          nautilus
          nemo-with-extensions
          obsidian
          openmw
          orca-slicer
          papirus-icon-theme
          pavucontrol
          picard
          prismlauncher
          proton-vpn
          puredata
          pureref
          r2modman
          showtime
          spotify
          ungoogled-chromium
          unityhub
          vintagestory
          winetricks
          xivlauncher
          zotero

          # Terminal applications
          appimage-run
          bat
          brightnessctl
          btop
          clipse
          direnv
          dive
          eza
          fd
          fzf
          htop
          just
          lazygit
          lf
          podman-compose
          podman-tui
          ripgrep
          unrar
          unzip
          yazi
          zip
          zoxide
        ];

        xdg = {
          cache.directory = "/home/${user}/.cache";
          data.directory = "/home/${user}/.local/share";
          state.directory = "/home/${user}/.local/state";
          config = {
            directory = "/home/${user}/.config";
            files = {
              # Default user directories
              "user-dirs.dirs".text = ''
                XDG_DESKTOP_DIR     = "/home/${user}/desktop"
                XDG_DOCUMENTS_DIR   = "/home/${user}/docs"
                XDG_DOWNLOAD_DIR    = "/home/${user}/downloads"
                XDG_MUSIC_DIR       = "/home/${user}/media/audio/music"
                XDG_PICTURES_DIR    = "/home/${user}/media/images"
                XDG_PROJECTS_DIR    = "/home/${user}/dev"
                XDG_PUBLICSHARE_DIR = "/home/${user}/public"
                XDG_TEMPLATES_DIR   = "/home/${user}/templates"
                XDG_VIDEOS_DIR      = "/home/${user}/media/video"
              '';

              # Default applications
              "mimeapps.list".text =
                let
                  mimeList =
                    apps: type: subtypes:
                    lib.strings.removeSuffix "\n"
                    <| lib.strings.concatLines
                    <| map (s: "${type}/${s}=${apps}") subtypes;

                  applications = ''
                    text/plain=neovide.desktop
                    inode/directory=nemo.desktop
                    application/pdf=zathura.desktop;sioyek.desktop'';

                  audio = mimeList "decibels.desktop;gapless.desktop" "audio" [
                    "aac"
                    "aacp"
                    "aiff"
                    "basic"
                    "flac"
                    "midi"
                    "mp4"
                    "mpeg"
                    "ogg"
                    "wav"
                    "webm"
                  ];

                  browsers =
                    let
                      apps = "zen.desktop;firefox.desktop;brave.desktop";
                    in
                    "text/html = ${apps}\n"
                    + mimeList apps "x-scheme-handler" [
                      "about"
                      "http"
                      "https"
                      "unkown"
                    ];

                  images = mimeList "loupe.desktop" "image" [
                    "bmp"
                    "gif"
                    "heic"
                    "jpeg"
                    "png"
                    "svg+xml"
                    "webp"
                  ];

                  video = mimeList "showtime.desktop" "video" [
                    "h261"
                    "h263"
                    "h264"
                    "jpeg"
                    "mp4"
                    "mpeg"
                    "ogg"
                    "webm"
                  ];

                in
                ''
                  [Added Associations]
                  ${applications}
                  ${audio}
                  ${browsers}
                  ${images}
                  ${video}

                  [Default Applications]
                  ${applications}
                  ${audio}
                  ${browsers}
                  ${images}
                  ${video}
                '';
            };
          };
        };
      };
    };
}
