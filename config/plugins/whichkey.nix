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
        { group = "+code-specific"; __unkeyed-1 = "<leader>cc"; mode = [ "n" "v" ]; }
        { group = "+markdown"; __unkeyed-1 = "<leader>ccm"; mode = [ "n" "v" ]; }
        
        { group = "+debug";         __unkeyed-1 = "<leader>d"; mode = [ "n" "v" ]; }
        { group = "+git";           __unkeyed-1 = "<leader>g"; mode = [ "n" "v" ]; }
        { group = "+search";        __unkeyed-1 = "<leader><leader>"; mode = "n"; }
        { group = "+utilities";     __unkeyed-1 = "<leader>u"; mode = "n"; }
        { group = "+colour";        __unkeyed-1 = "<leader>uc"; mode = "n"; }
      ];
    };
  };
  
  keymaps = [
    # up and down in multiline
    { mode = "n"; key = "j"; action = "gj"; }
    { mode = "n"; key = "k"; action = "gk"; }

    # Set highlight on search, but clear on pressing <Esc> in normal mode
    { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; }
    { mode = ["n" "v"]; key = "i"; action = "<cmd>nohlsearch<CR>i"; }
    { mode = ["n" "v"]; key = "a"; action = "<cmd>nohlsearch<CR>a"; }
    { mode = ["n" "v"]; key = "I"; action = "<cmd>nohlsearch<CR>I"; }
    { mode = ["n" "v"]; key = "A"; action = "<cmd>nohlsearch<CR>A"; }

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
    { mode = "n"; key = "<leader>f"; action =  "<cmd>lua MiniFiles.open()<CR>"; options = { desc = "Open files"; silent = true;  }
    # terminal
    { mode = "n"; key = "<leader>t"; action = "<cmd>Lspsaga term_toggle<CR>"; options = { desc = "Toggle terminal"; silent = true; }; } 

    # fuzzy
    { mode = "n"; key = "<leader><leader>f"; action =  "<cmd>Pick files<CR>";            options = { desc = "Pick files"; silent = true; };}
    { mode = "n"; key = "<leader><leader>b"; action =  "<cmd>Pick buffers<CR>";          options = { desc = "Pick buffers"; silent = true; };}
    { mode = "n"; key = "<leader><leader>e"; action =  "<cmd>Pick explorer<CR>";         options = { desc = "Pick explorer"; silent = true; };}
    { mode = "n"; key = "<leader><leader>m"; action =  "<cmd>Pick marks<CR>";            options = { desc = "Pick marks"; silent = true; };}
    { mode = "n"; key = "<leader><leader><leader>"; action =  "<cmd>Pick grep_live<CR>"; options = { desc = "Pick grep"; silent = true; };}

    # fold
    { mode = "n"; key = "<leader>zf"; action =  "V%zf"; options.desc = "Fold Code"; }

    # utilities
    { mode = "n"; key = "<leader>ucp"; action =  "<cmd>CccPick<CR>"; options.desc = "Color Picker"; }
    { mode = "n"; key = "<leader>ucc"; action =  "<cmd>CccConvert<CR>"; options.desc = "Convert Color"; }


    # lsp
    { mode = "n"; key = "<leader>cD"; action = "<cmd>Lspsaga hover_doc<CR>"; options = { desc = "Hover"; silent = true; }; } 
    { mode = "n"; key = "<leader>ca"; action = "<cmd>Lspsaga code_action<CR>"; options = { desc = "Code Action"; silent = true; }; } 
    { mode = "n"; key = "<leader>cd"; action = "<cmd>Lspsaga show_line_diagnostics<CR>"; options = { desc = "Line Diagnostics"; silent = true; }; } 
    { mode = "n"; key = "<leader>ci"; action = "<cmd>Lspsaga finder imp<CR>"; options = { desc = "Goto Implementation"; silent = true; }; } 
    { mode = "n"; key = "<leader>cj"; action = "<cmd>Lspsaga diagnostic_jump_next<CR>"; options = { desc = "Next Diagnostic"; silent = true; }; } 
    { mode = "n"; key = "<leader>ck"; action = "<cmd>Lspsaga diagnostic_jump_prev<CR>"; options = { desc = "Previous Diagnostic"; silent = true; }; } 
    { mode = "n"; key = "<leader>cr"; action = "<cmd>Lspsaga rename<CR>"; options = { desc = "Rename"; silent = true; }; } 
    { mode = "n"; key = "<leader>ct"; action = "<cmd>Lspsaga peek_type_definition<CR>"; options = { desc = "Type Definition"; silent = true; }; } 
    { mode = "n"; key = "<leader>cw"; action = "<cmd>Lspsaga outline<CR>"; options = { desc = "Outline"; silent = true; }; } 
    { mode = "n"; key = "gD"; action = "<cmd>Lspsaga show_line_diagnostics<CR>"; options = { desc = "Goto Declaration"; silent = true; }; } 
    { mode = "n"; key = "gd"; action = "<cmd>Lspsaga finder def<CR>"; options = { desc = "Goto Definition"; silent = true; }; } 
    { mode = "n"; key = "gr"; action = "<cmd>Lspsaga finder ref<CR>"; options = { desc = "Goto References"; silent = true; }; } 
  ];
}
