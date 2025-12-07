{ pkgs, ... }:
{
  plugins = {
    lsp.enable = true;
    dap.enable = true;
    conform-nvim.enable = true;

    cmp-dap.enable = true;
    cmp-emoji.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = { 
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-n>" = "cmp.mapping.scroll_docs(-4)";
          "<C-p>" = "cmp.mapping.scroll_docs(4)";
          "<C-g>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        window.completion.border =    [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
        window.documentation.border =    [ "┌" "─" "┐" "│" "┘" "─" "└" "│" ];
      };
    };

    lspsaga = {
      enable = true;
      settings = {
        hover.openCmd = "!xdg-open";
        codeAction.keys = {
          exec = "<CR>";
          quit = [
            "<Esc>"
            "q"
          ];
        };
        lightbulb = {
          enable = false;
          sign = false;
          virtualText = true;
        };
        definition = {
          keys = {
            edit = "<CR>";
            split = "s";
            vsplit = "v";
            close = [
              "q"
              "<Esc>"
            ];
            quit = [
              "q"
              "<Esc>"
            ];
          };
        };
        rename = {
          autoSave = false;
          keys = {
            exec = "<CR>";
            quit = [
              "<C-k>"
              "<Esc>"
            ];
            select = "x";
          };
        };
        scrollPreview = {
          scrollDown = "<C-p>";
          scrollUp = "<C-n>";
        };

      };
    };
    
    treesitter-context.enable = false;
    treesitter-refactor.enable = false;
    treesitter-textobjects.enable = false;
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c 
        diff
        gleam
        glsl
        hyprlang
        cpp
        lua 
        make
        powershell
        bash
        nix

        regex
        gitignore
        gitcommit
        gitattributes
        git_config
        git_rebase

        wgsl
        css
        scss
        typescript
        javascript
        html

        markdown
        json
        toml
        xml
        yaml
      ];
    };

  };
}
