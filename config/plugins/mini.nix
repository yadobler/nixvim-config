{
  keymaps = [
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      tabline = {};
      statusline = {};
      extra = {};
      pick = {};
      cursorword = {};
      fuzzy = {};
      git = {};
      indentscope = {};
      pairs = {};
      splitjoin = {};
      icons.style = "glyph";
      notify.lsp_progress.enable = false;
      files = {
        mappings = { 
          close = "<Esc>"; 
        };
      };
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
      align = {
        mappings = {
          start = "ga";
          start_with_preview = "gA";
        };
        silent = false;
      };
      comment = {
        mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
        };
      };

      diff = {
        view.style = "sign";
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
    };
  };
}
