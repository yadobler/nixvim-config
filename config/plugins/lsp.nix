{ pkgs, ... }:
{
  plugins.friendly-snippets.enable = true;

  plugins.lsp = {
      enable = true;
  };

  plugins.dap = {
      enable = true;

  };

  plugins.treesitter = {
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
  
  plugins.treesitter-context.enable = false;
  plugins.treesitter-refactor.enable = true;
  plugins.treesitter-textobjects.enable = true;
}
