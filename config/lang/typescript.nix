{ pkgs, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        javascript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        svelte = [ "eslint_d" ];
      };

      formatters.eslint_d = {
        command = "${pkgs.eslint_d}/bin/eslint_d";
      };
    };
    
    ts-autotag.enable = true;

    typescript-tools = {
      enable = true;
      settings = {
        tsserver_plugins = [ 
          "typescript-svelte-plugin" 
        ];
        # filetypes = [
        #   "javascript"
        #   "javascriptreact"
        #   "typescript"
        #   "typescriptreact"
        #   "svelte"
        #   # "mdx"
        # ];
      };
    };

    lsp.servers = {
      eslint = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
          "vue"
          "html"
          # "markdown"
          # "mdx"
          "json"
          "jsonc"
          "yaml"
          "toml"
          "xml"
          "gql"
          "graphql"
          "svelte"
          "css"
          "less"
          "scss"
          "pcss"
          "postcss"
        ];
      };
    };
  };
}
