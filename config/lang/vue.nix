{ ... }:
{
  plugins.treesitter.settings.highlight.disable = [ "vue" ];
  plugins.treesitter.settings.indent.disable = [ "vue" ];
  # plugins.lsp.servers.volar.enable = true;
  plugins.lsp.servers.vue_ls.enable = true;
}
