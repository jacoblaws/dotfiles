{ pkgs, ... }: {
  services.xserver.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    luaModules = with pkgs.luaPackages; [
      luarocks     # package manager for lua modules
      luadbi-mysql # database abstraction layer
    ];
  };
}
