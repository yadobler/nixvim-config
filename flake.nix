{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { self, nixpkgs, nixvim, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      packages = forAllSystems (system:
        let 
          pkgs = import nixpkgs { inherit system; };
          nixvim' = nixvim.legacyPackages.${system};

          mkNvim = colorScheme: nixvim'.makeNixvimWithModule {
            inherit pkgs;
            extraSpecialArgs = { inherit colorScheme; };
            module = import ./config;
          };
        in
          {
          default = mkNvim null;
          withColor = mkNvim;
        });
    };
}
