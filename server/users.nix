{
  config,
  pkgs,
  ...
}: {
  users.groups.ssh-access = {};

  users.mutableUsers = false;

  users.users."gustav" = {
    isNormalUser = true;
    initialPassword = "1234";
    extraGroups = ["wheel" "ssh-access"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAVQjtd/jEPI3IgWyKiwvBD9S2hbLEZ249tOy8HpN2Ci gustav.pettersson2@outlook.com"
    ];
  };
}
