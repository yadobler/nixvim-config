{ pkgs, ... }:
{
  colorschemes = {
    oxocarbon.enable = true;
    gruvbox.enable = false;
    onedark.enable = false;
    cyberdream.enable = false;
    base16 = {
      enable = false;
      colorscheme = "tokyo-night-dark";
    };
  };
  # plugins.transparent.enable = true;

}
