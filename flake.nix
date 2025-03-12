{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { self, nixpkgs, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      nixvim' = nixvim.legacyPackages.${system};

      mkNvim = colorScheme: nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = import ./config;
        extraSpecialArgs = { inherit colorScheme; };
      };
    in {
      packages.${system} = {
        default = mkNvim null;
        withColor = mkNvim;
      };
    };
}
