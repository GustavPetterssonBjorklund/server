{pkgs, ...}: let
  pythonWithPip = pkgs.python3.withPackages (po:
    with po; [
      pip
    ]);
in {
  programs = {
    git.enable = true;
    htop.enable = true;
    neovim = {
      defaultEditor = true;
      enable = true;
    };
    tmux.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bat
    dust
    fastfetch
    file
    gnupg
    lm_sensors
    nethogs
    nvtopPackages.nvidia
    pciutils
    pythonWithPip
    ripgrep
    wget
  ];
}
