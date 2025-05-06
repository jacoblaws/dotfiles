{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # cli
    lf
    fd
    fzf
    eza
    bat
    just
    ripgrep
    lazygit
    zip
    unzip
    unrar
    dive
    podman-tui
    podman-compose
    bun
    texliveFull
    yazi
    appimage-run
    protonvpn-cli
    typst
    zjstatus
    wl-clipboard
    clipse

    # gui
    firefox
    spotify
    discord
    obsidian
    pavucontrol
    prismlauncher
    r2modman
    calibre
    lutris
    picard
    rofi-wayland
    drawio
    xivlauncher
    zotero
    r2modman
    libreoffice
    anki
    nemo
    gnome-calculator
    protonvpn-gui

    # wine
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    # misc
    nwg-look
    gnome-tweaks

    (pkgs.symlinkJoin {
      name = "orca-slicer";
      paths = [ pkgs.orca-slicer ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
          wrapProgram $out/bin/orca-slicer \
          --set __GLX_VENDOR_LIBRARY_NAME mesa \
          --set __EGL_VENDOR_LIBRARY_FILENAMES ${pkgs.mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json
      '';
      meta.mainProgram = "orca-slicer";
    })
  ];
}
