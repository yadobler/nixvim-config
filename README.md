- use `./install.sh` to install globally via nix profile
- use `nix build '.#nvim'` to build locally (you will generate a `./result` symlink
- to incoporate into `configuration.nix`:
  1. Add flake source to your `flake.nix`, supposing:
     ```nix
     inputs.nixvim.url = "./modules/nixvim-config";
     ```
  2. Add the flake into your `configuration.nix` (ensure `system` and `inputs` are passed in via `extraSpecialArgs` in flake file):
     ```nix
     environment.systemPackages = [ inputs.nixvim.packages.${system}.default ];
     ```

I suggest testing locally with just `nix build` and `result/bin/nvim`, and once happy, rebuild your nixos.
