{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.desktop ];
  };

  flake.nixosModules.desktop =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports =
        let
          nixosModules = with self.nixosModules; [
            # External modules
            # extended
            hjem
            musnix

            # NixOS
            audio
            core
            fonts
            graphics
            programs
            noctalia-greeter

            # Home
            firefox
            fish
            ghostty
            hyprland
            neovim
            noctalia
            starship
            zed
            zellij
            zen

            # Scripts
            bin
          ];
        in
        [ (modulesPath + "/installer/scan/not-detected.nix") ] ++ nixosModules;

      hjem = {
        clobberByDefault = true;
        users.jvl.directory = "/home/jvl";
      };

      # Hardware configuration
      boot = {
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];

        initrd = {
          kernelModules = [ ];
          availableKernelModules = [
            "xhci_pci"
            "ahci"
            "nvme"
            "usbhid"
            "usb_storage"
            "sd_mod"
          ];
        };
      };

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/09b3ca63-146f-4aef-a7e6-6dc77eb22bc7";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/4FB7-030F";
        fsType = "vfat";
      };

      fileSystems."/home/jvl/media" = {
        device = "/dev/disk/by-uuid/19f2746c-bd1a-44d8-8e9e-3d16c007d774";
        fsType = "ext4";
      };

      swapDevices = [ ];

      networking = {
        hostName = "desktop";
        useDHCP = lib.mkDefault true;
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
