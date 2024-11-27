{ nixpkgs, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
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
    cliphist
    dive
    podman-tui
    podman-compose
    bun
    texliveFull
    yazi

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

    # wine
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    # misc
    nwg-look
    gnome-tweaks
    qogir-icon-theme
    papirus-icon-theme
  ];

  nixpkgs.config.permittedInsecurePackages =
    pkgs.lib.optional (pkgs.obsidian.version == "1.5.3") "electron-25.9.0";
}
