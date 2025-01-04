{ pkgs, ... }:
{
  plugins = {
    lsp.enable = true;
    dap.enable = true;

    cmp-dap.enable = true;
    cmp-emoji.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;

    cmp = {
      autoEnableSources = true;
      settings = { 
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-u>" = "cmp.mapping.scroll_docs(4)";
          "<Esc>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        window.completion.border =    [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
        window.documentation.border =    [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
      };
    };


    treesitter-context.enable = false;
    treesitter-refactor.enable = true;
    treesitter-textobjects.enable = true;
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        cpp
        bash
        lua 
        make
        markdown
        nix
        regex
        css
        typescript
        javascript
        html
        astro
        json
        toml
        xml
        yaml

      ];
    };

  };
}
