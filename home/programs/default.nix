{ pkgs, ... }: {
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
    drawio
    firefox
    gnome-calculator
    libreoffice
    nemo
    obsidian
    protonvpn-gui
    zotero

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
