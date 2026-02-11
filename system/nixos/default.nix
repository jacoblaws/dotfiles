{ config, pkgs, inputs, user, ... }:
let theme = config.themes.everforest.dark;
in {
  imports = [
    ./programs
    ./services
    ./fontconfig.nix
    ./graphics.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.musnix.nixosModules.musnix
  ];

  documentation.man.generateCaches = false;
  security.rtkit.enable = true;
  networking.networkmanager.enable = true;

  hardware = {
    bluetooth.enable = true;
    opentabletdriver.enable = true;
    uinput.enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  virtualisation = {
    libvirtd.enable = true;
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enable = true;
    };
  };

  musnix = {
    enable = true;
    alsaSeq.enable = true;
    rtcqs.enable = true;
  };

  users.users.${user} = {
    shell = pkgs.bash;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm" ];
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console.colors = [
    "${theme.bg0}"
    "${theme.red}"
    "${theme.green}"
    "${theme.yellow}"
    "${theme.blue}"
    "${theme.magenta}"
    "${theme.cyan}"
    "${theme.fg}"
    "${theme.bg3}"
    "${theme.red}"
    "${theme.green}"
    "${theme.yellow}"
    "${theme.blue}"
    "${theme.magenta}"
    "${theme.cyan}"
    "${theme.fg}"
  ];

  system.stateVersion = "23.11";
}

