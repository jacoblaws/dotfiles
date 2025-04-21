{ pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./themes.nix
  ];

  environment.systemPackages = [ pkgs.git ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  security = { rtkit.enable = true; };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enable = true;
    };
  };

  users.users.jvl = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  time.timeZone = "America/Los_Angeles";
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

  console = {
    colors = [
      "2d353b" # black
      "e67e80" # red
      "a7c080" # green
      "dbbc7f" # yellow
      "7fbbb3" # blue
      "d699b6" # magenta
      "83c092" # cyan
      "859289" # gray
      "7a8478" # dark gray
      "e67e80" # light red
      "a7c080" # light green
      "dbbc7f" # light yellow
      "7fbbb3" # light blue
      "d699b6" # light magenta
      "83c092" # light cyan
      "d3c6aa" # white
    ];
  };

  system.stateVersion = "23.11";
}
