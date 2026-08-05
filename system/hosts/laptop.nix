{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.laptop ];
  };

  flake.nixosModules.laptop =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      _module.args = {
        user = "jvl";
        cfgPath = path: "/home/jvl/dotfiles/home/config/" + path;
      };

      imports =
        let
          nixosModules = with self.nixosModules; [
            # External modules
            hjem
            musnix
            themes
            utl

            # NixOS
            audio
            core
            fonts
            graphics
            programs

            # Home
            homeBase
            browsers
            wayland
            editors
            terminal
            office

            # Scripts
            bin
          ];
        in
        [ (modulesPath + "/installer/scan/not-detected.nix") ] ++ nixosModules;

      # Hardware configuration
      boot = {
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];

        initrd = {
          kernelModules = [ ];
          availableKernelModules = [
            "xhci_pci"
            "nvme"
          ];
        };
      };

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/21069338-4d24-41f2-ac01-4ebb908249aa";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/D0EE-A8CE";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      swapDevices = [ ];

      networking = {
        hostName = "laptop";
        useDHCP = lib.mkDefault true;
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
