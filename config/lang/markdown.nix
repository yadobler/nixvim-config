{ lib, pkgs, ... }:
let
  helpers = lib.nixvim;
in
  {
  extraPackages = with pkgs; [
    marksman
  ];

  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "mdx.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "davidmh";
      repo = "mdx.nvim";
      rev = "ae83959";
      hash = "sha256-z835i8QkQFe185sgSLtUaaTsMs2Px9x6KTObTRAOFz0=";
    };
  })
(pkgs.vimUtils.buildVimPlugin {
    name = "mediawiki.vim";
    src = pkgs.fetchFromGitHub {
      owner = "chikamichi";
      repo = "mediawiki.vim";
      rev = "26e5737";
        hash = "sha256-Tgza7QAzNu0D5cuDyH/jR3rvTuoV2DRA2MBCKjiPUdE=";
      };
    })
  ];

  extraConfigLua = ''
    require("mdx").setup {}
  '';

  plugins = {
    clipboard-image = {
      enable = true;
      clipboardPackage = pkgs.wl-clipboard;
    };

    image = {
      enable = helpers.enableExceptInTests;
      integrations.markdown = {
        clearInInsertMode = true;
        # onlyRenderImageAtCursor = true;
      };
    };

    markdown-preview = {
      enable = true;
    };

    conform-nvim.settings = {
      formatters_by_ft.mdx = [
        "prettierd"
        "prettier"
      ];
      formatters = {
        prettierd.command = "${pkgs.prettierd}/bin/prettierd";
        prettier.command = "${pkgs.nodePackages.prettier}/bin/prettier";
      };
    };

    lsp.servers = {
      marksman.enable = true;
      mdx_analyzer = {
        enable = false;
      };

      ltex = {
        enable = false;
        filetypes = [
          "markdown"
          "text"
          "mdx"
        ];

        settings.completionEnabled = true;

        extraOptions = {
          checkFrequency = "save";
          language = "en-GB";
          loglevel = "warning";
          diagnosticSeverity = "information";
          trace.server = "off";
        };
      };
    };

    lint = {
      lintersByFt.md = [ "markdownlint-cli2" ];
      linters.markdownlint-cli2.cmd = "${pkgs.markdownlint-cli2}/bin/markdownlint-cli2";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ccmp";
      action = "<cmd>MarkdownPreviewToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];
}
