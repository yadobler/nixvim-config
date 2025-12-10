{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      ai = {};

      align = {
        mappings = {
          start_with_preview = "ga";
          start = "gA";
        };
        silent = false;
      };

      bracketed = { };

      comment = {
        mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
        };
      };

      cursorword = {};

      diff = {
        
        view = {
          style = "sign";
          signs = {
            add = "│";
            change = "│";
            delete = "-";
          };
        };

        mappings = {
          # Apply hunks inside a visual/operator region
          apply = "<leader>gh";

          # Reset hunks inside a visual/operator region
          reset = "<leader>gH";

          # Hunk range textobject to be used inside operator
          # Works also in Visual mode if mapping differs from apply and reset
          textobject = "<leader>gh";

          # Go to hunk range in corresponding direction
          goto_first = "<leader>gg";
          goto_prev =  "<leader>gk";
          goto_next =  "<leader>gj";
          goto_last =  "<leader>gG";
        };
      };

      extra = {};

      files = {
        mappings = { 
          close = "<Esc>"; 
        };
      };

      fuzzy = {};
      git = {};
      
      hipatterns = {
        highlighters = {
          # Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]"; group = "MiniHipatternsFixme"; };
          hack  = { pattern = "%f[%w]()HACK()%f[%W]";  group = "MiniHipatternsHack";  };
          todo  = { pattern = "%f[%w]()TODO()%f[%W]";  group = "MiniHipatternsTodo";  };
          note  = { pattern = "%f[%w]()NOTE()%f[%W]";  group = "MiniHipatternsNote";  };

          # hex colors will not use mini hipatterns

    #       hex_color.__raw = ''
    #         require('mini.hipatterns').gen_highlighter.hex_color()
    #         '';
    #
    # # https://github.com/nvim-mini/mini.nvim/discussions/1024
    # # thank you tigion
    #       hex_color_short.__raw = ''{ pattern = '#%x%x%x%f[%X]', group = hex_color_short, extmark_opts = extmark_opts_inline },
    #     -- `rgb(255, 255, 255)`''
    #     rgb_color.__raw = ''{ pattern = 'rgb%(%d+, ?%d+, ?%d+%)', group = rgb_color, extmark_opts = extmark_opts_inline },
    #     -- `rgba(255, 255, 255, 0.5)`''
    #     rgba_color.__raw = ''{
    #       pattern = 'rgba%(%d+, ?%d+, ?%d+, ?%d*%.?%d*%)',
    #       group = rgba_color,
    #       extmark_opts = extmark_opts_inline,
    #     },''
        };
      };

      icons.style = "glyph";

      indentscope = {};
      
      notify.lsp_progress.enable = false;

      pairs = {};

      pick = {};

      splitjoin = {};

      statusline = {};

      tabline = {};
    };
  };
}
