{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-astro
  ];

  plugins.treesitter.settings.highlight.disable = [ "astro" ];
}
