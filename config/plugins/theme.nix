{ ... }:
let 
    # Check if the base16 file exists
    base16FileExists = builtins.pathExists ./nixvim-base16.nix;
in
{
  colorschemes = {

    base16 = {
      enable = base16FileExists;
      colorscheme = if base16FileExists then import ./nixvim-base16.nix else null;
    };
    oxocarbon.enable = !base16FileExists;
    gruvbox.enable = false;
    onedark.enable = false;
    cyberdream.enable = false;

  };
  # plugins.transparent.enable = true;
}
