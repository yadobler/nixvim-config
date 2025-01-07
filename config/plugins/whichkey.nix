{
  plugins.which-key = {
    enable = true;
    settings = {

      icons = {
        breadcrumb = "»";
        group = "+";
        separator = "➜"; # 
      };

      win.border = "single";

      spec = [
        { group = "+code";          __unkeyed-1 = "<leader>c"; mode = [ "n" "v" ]; }
        { group = "+debug";         __unkeyed-1 = "<leader>d"; mode = [ "n" "v" ]; }
        { group = "+git";           __unkeyed-1 = "<leader>g"; mode = [ "n" "v" ]; }
        { group = "+find/file";     __unkeyed-1 = "<leader>f"; mode = "n"; }
        { group = "+search";        __unkeyed-1 = "<leader><leader>"; mode = "n"; }
      ];
    };
  };
  
  keymaps = [
    # up and down in multiline
    { mode = "n"; key = "j"; action = "gj"; }
    { mode = "n"; key = "k"; action = "gk"; }

    # Set highlight on search, but clear on pressing <Esc> in normal mode
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }

    # Allow search terms to stay in the middle
    { mode = "n"; key = "N"; action = "Nzzzv"; }
    { mode = "n"; key = "n"; action = "nzzzv"; }

    # new tab
    { mode = "n"; key = "gn"; action = "<cmd>tabnew<CR>"; options.desc = "Opens a new tab";}

    # buffer
    { mode = "n"; key = "<leader>j"; action = "<cmd>bn<CR>"; options.desc = "Previous buffer";}
    { mode = "n"; key = "<leader>k"; action = "<cmd>bp<CR>"; options.desc = "Next buffer";}
    { mode = "n"; key = "<leader>q"; action = "<cmd>bd<CR>"; options.desc = "Delete buffer";}
    
    # git
    { mode = "n"; key = "<leader>g:"; action =  "<cmd>Git"; }
    { mode = "n"; key = "<leader>gaf"; action =  "<cmd>Git add -f %<CR>"; }
    { mode = "n"; key = "<leader>gau"; action = "<cmd>Git add -u<CR>"; }
    { mode = "n"; key = "<leader>gcM"; action = "<cmd>Git commit<CR>"; }
    { mode = "n"; key = "<leader>gcm"; action = ":Git commit -m "; }
    { mode = "n"; key = "<leader>gl"; action =  "<cmd>Git log<CR>"; }
    { mode = "n"; key = "<leader>gp"; action =  "<cmd>Git push<CR>"; }
    { mode = "n"; key = "<leader>gs"; action =  "<cmd>Git status<CR>"; }

    # files
    { mode = "n"; key = "<leader>f"; action =  "<cmd>lua MiniFiles.open()<CR>"; }

    # fuzzy
    { mode = "n"; key = "<leader><leader>f"; action =  "<cmd>Pick files<CR>"; }
    { mode = "n"; key = "<leader><leader>b"; action =  "<cmd>Pick buff<CR>"; }
    { mode = "n"; key = "<leader><leader>e"; action =  "<cmd>Pick explorer<CR>"; }
  ];
}
