{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = false;
      useOSProber = true; # Auto detect
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # Animated boot
  boot.kernelParams = ["quiet" "splash"];
  boot.plymouth = {
    enable = true;
    theme = "fade-in";
  };
}
