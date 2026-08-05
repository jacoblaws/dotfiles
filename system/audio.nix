{
  flake.nixosModules.audio = { lib, ... }: {
    services = {
      pulseaudio.enable = lib.mkForce false;

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
        pulse.enable = true;
      };
    };

    musnix = {
      enable = true;
      alsaSeq.enable = true;
      rtcqs.enable = true;
    };

    # rtkit allows Pipewire to use the realtime scheduler
    security.rtkit.enable = true;
  };
}
