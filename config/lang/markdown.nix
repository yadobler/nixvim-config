{ lib, pkgs, ... }:
let
  helpers = lib.nixvim;
  peek-built = pkgs.stdenv.mkDerivation rec {
    pname = "peek-nvim";
    version = "latest"; 

    src = pkgs.fetchFromGitHub {
      owner = "toppair";
      repo = "peek.nvim";
      rev = "5820d937d5414baea5f586dc2a3d912a74636e5b"; 
      hash = "sha256-hGIPxHwTSXTHFJ3JiVATMjEmoFhZ87fWElj1AMPMbQU="; 
    };

    nativeBuildInputs = [ pkgs.deno ];

    # Deno needs a writable home directory during the build
    buildPhase = ''
      export DENO_DIR=$TMPDIR/deno-dir
      export DENO_NO_UPDATE_CHECK=1
      deno task build:fast
      '';

    installPhase = ''
      mkdir -p $out
      cp -r . $out
      '';

    # Adding 'outputHash' allows network access for Deno to fetch dependencies.
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    outputHash = "sha256-/2m6YBXGGWbZWzq1mNmoGnndS3kP2AQFD+Wy8PGcrCE="; 
  };
in
  {
  extraPackages = with pkgs; [
    marksman
    deno
  ];

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
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
    markdown-preview = {
      enable = false;
    };
    peek = {
      enable = true;
      package = peek-built;
      settings = {
        app = "browser";
      };
    };
    render-markdown = {
      enable = true;
      settings = {
        enabled = true;
        file_types = ["markdown" "mdx"];
      };
    }; 

    clipboard-image = {
      enable = true;
      clipboardPackage = pkgs.wl-clipboard;
    };

    image = {
      enable = helpers.enableExceptInTests;
      settings.integrations.markdown = {
        clearInInsertMode = true;
        onlyRenderImageAtCursor = true;
        filetypes = ["markdown" "vimwiki" "quarto"];
      };
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
      # action = "<cmd>MarkdownPreviewToggle<cr>";
      action = "<cmd>PeekOpen<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];
}
