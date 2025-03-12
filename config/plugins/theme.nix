{ colorScheme, lib, ... }:
let
  chosencolorScheme = lib.optionalAttrs (colorScheme != null) (
    {
      base16 = {
        enable = true;
        colorScheme = colorScheme.palette; 
      };
      gruvbox.enable = false;
    }
  ) // {
    base16.enable = false;
    gruvbox.enable = true;
  };
in
{
  colorschemes = chosencolorScheme;
  # plugins.transparent.enable = true;
}
