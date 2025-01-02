{
  keymaps = [
    { mode = "n"; key = "<leader>gcm"; action = "<cmd>git commit<CR>"; }
    { mode = "n"; key = "<leader>gs"; action = "<cmd>git status<CR>"; }
    { mode = "n"; key = "<leader>gl"; action = "<cmd>git log<CR>"; }
    { mode = "n"; key = "<leader>gp"; action = "<cmd>git push<CR>"; }
    { mode = "n"; key = "<leader>g:"; action = "<cmd>git"; }
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      tabline = {};
      extra = {};
      files = {};
      pick = {};
      completion = {};
      cursorword = {};
      fuzzy = {};
      git = {};
      indentscope = {};
      notify = {};
      pairs = {};
      snippets = {};
      icons.style = "glyph";

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
