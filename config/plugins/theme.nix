{ colorScheme, lib, ... }:
{
  colorschemes =
    if colorScheme != null then {
      base16 = {
        enable = true;
        colorscheme = colorScheme.colorScheme.palette;
      };
      gruvbox.enable = false;
    } else {
      base16.enable = false;
      gruvbox.enable = true;
    };

  # plugins.transparent.enable = true;
}
