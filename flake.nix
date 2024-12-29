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

        perSystem =
        { pkgs, system, ... }:
        let
            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};
            nixvimModule = {
                inherit pkgs;
                module = import ./config; 
                extraSpecialArgs = {
                    # inherit (inputs) foo;
                };
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
            installer = pkgs.mkShell {
                shellHook = ''
                    nix build -o nvim_result
                    nix profile remove nixvim 
                    nix profile install ./nvim_result
                    rm ./nvim_result
                    return
                    '';
            };
        in
        {
            checks = {
                # Run `nix flake check .` to verify that your config is not broken
                default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
            };
            packages = {
                # Lets you run `nix run .` to install nixvim
                default = nvim;
            };
            devShells.default = installer;

            
        };
    };
    
} 
