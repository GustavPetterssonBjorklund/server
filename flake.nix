{
  description = "General nixos cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};

      modules = [
        ./server/configuration.nix
      ];
    };
  };
}
