{ inputs, pkgs, ... }: {
  imports = [
    ./editors
    ./media
    ./office
    ./terminal
    ./themes
    ./wayland
  ];

  home.packages = with pkgs; [
    anki
    calibre
    discord
    drawio
    firefox
    gnome-calculator
    libreoffice
    lutris
    nemo
    obsidian
    pavucontrol
    picard
    prismlauncher
    protonvpn-gui
    r2modman
    spotify
    xivlauncher
    zotero
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge

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
