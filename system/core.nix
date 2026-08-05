{ inputs, ... }: {
  flake.nixosModules.core =
    { pkgs, themes, ... }:
    let
      theme = themes.everforest.dark;
    in
    {
      documentation.man.cache.enable = false;
      networking.networkmanager.enable = true;

      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
      };

      hardware = {
        bluetooth.enable = true;
        opentabletdriver.enable = true;
        uinput.enable = true;
      };

      users.users.jvl = {
        shell = pkgs.bash;
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
          "audio"
          "kvm"
        ];
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

      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped;
            zjstatus = inputs.zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
          })
        ];
      };

      nix = {
        optimise.automatic = true;
        settings.experimental-features = "flakes nix-command pipe-operators";

        settings = {
          substituters = [
            "https://cache.nixos.org?priority=10"
            "https://niri.cachix.org"
            "https://hyprland.cachix.org"
            "https://nix-gaming.cachix.org"
            "https://nix-community.cachix.org"

          ];

          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
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

      system.stateVersion = "26.05";
    };
}
