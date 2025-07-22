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
          hex_color.__raw = ''
            require('mini.hipatterns').gen_highlighter.hex_color()
            '';
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
