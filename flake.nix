{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};

          mkNvim = colorscheme: nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = {
              colorscheme = if colorscheme == null then null else colorscheme;
            };
          };

        in {
          checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { colorscheme = null; };
          };

          packages = {
            default = mkNvim null;  # Default without colorscheme
            withColors = mkNvim;    # Function to create nvim with custom colorscheme
          };
        };
    };
}
