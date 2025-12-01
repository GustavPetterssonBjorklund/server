{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./disco-config.nix
    ./hardware-configuration.nix
    ./bootloader.nix
    ./programs.nix
    ./nix.nix
    ./users.nix

    ./openssh.nix
  ];

  system.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;
}
