{
  description = "General nixos cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    disko,
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
