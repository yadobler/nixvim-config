{ pkgs, ... }:
{
  plugins.treesitter.settings.highlight.disable = [ "astro" ];
  plugins.lsp.servers.astro.enable = true;
}
