{
  imports = [
    ./plugins
    ./lang
    ./autocmd.nix
  ];
  extraConfigLua = ''
      -- locale
      vim.o.spelllang = vim.o.spelllang .. ",cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
      vim.o.shortmess = vim.o.shortmess .. "c" -- don't show redundant messages from ins-completion-menu
      vim.o.shortmess = vim.o.shortmess .. "I" -- don't show the default intro message
      vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,],h,l"

      vim.g.neovide_transparency = 1.0
      vim.g.neovide_scale_factor = 1.0
      vim.g.neovide_floating_shadow = false
      vim.g.neovide_cursor_vfx_mode = ""
      vim.g.neovide_cursor_animation_length = 0.1
      vim.g.neovide_cursor_trail_size = 0.8

      local function get_python_host_prog()
        local handle = io.popen("which python")
        if handle then
          local python_path = handle:read("*l")
          handle:close()
          if python_path and python_path ~= "" then
            return vim.fn.expand(python_path)
          end
        end
        -- Fallback to Neovim's default if `which python` fails
        return vim.g.python3_host_prog
      end

      vim.g.python3_host_prog = get_python_host_prog()
      vim.g.python_host_prog = get_python_host_prog()
      '';

  globals = {
    autochdir = false;
    have_nerd_font = true;

    # leader keys
    mapleader = " ";
    localmapleader = " ";
  };

  opts = {
    # Display
    termguicolors = true;
    guifont = "JetBrainsMono Nerd Font Mono:h13";
    encoding = "utf-8";
    showmode = false;
    laststatus = 3;
    background = "dark";
    backspace = "indent,eol,start";
    linespace = 0;

    # Timeouts
    timeoutlen = 500;
    ttimeout = true;
    ttimeoutlen = 5;
    updatetime = 250;

    # Visual Updating
    signcolumn = "yes";
    scrolloff = 5;
    showmatch = true;
    errorbells = false;
    # colorcolumn = 100;

    # Mouse
    mouse = "nv";
    mousefocus = true;

    # Numbering
    number = true;
    relativenumber = true;
    ruler = false;

    # Autoformatting
    autoindent = true;
    expandtab = true;
    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
    wrap = false;
    #smartindent = true;
    #foldenable = true;
    #foldlevelstart = 99;
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()"; # Use treesitter for folding
    foldlevel = 99;
    #copyindent = true;


    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;

    # Metadata
    history = 100;
    undofile = true;

    # Preview substitutions live, as you type!
    inccommand = "split";

    # clipboard
    # clipboard = "unnamedplus"; # syncs system clipboard with vim clipboard 
    # I prefer to just use "+ explicitly else the system clipboard will be polluted with 
    # every single edit command like c and d.

  };
}
