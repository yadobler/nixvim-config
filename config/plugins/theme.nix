{ colorscheme, lib, ... }:
let
  chosenColorscheme = lib.optionalAttrs (colorscheme != null) (
    {
      base16 = {
        enable = true;
        colorscheme = colorscheme.palette; 
      };
      gruvbox.enable = false;
    }
  ) // {
    base16.enable = false;
    gruvbox.enable = true;
  };
in
{
  colorschemes = chosenColorscheme;
  # plugins.transparent.enable = true;
}
