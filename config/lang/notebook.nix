{ pkgs, ...}:

{
  plugins = {
    molten = {
      enable = true;
      settings = {
        auto_open_output = false;
        image_provider = "image.nvim";
        wrap_output = true;
        virt_text_output = true;
        virt_lines_off_by_1 = true;
      };
    };

    quarto = {
      enable = true;
      settings = {
        lspFeatures = {
          chunks = "all";
          diagnostics = {
            enabled = true;
            triggers = ["BufWritePost"];
          };
          completion = {
            enabled = true;
          };
        };
        codeRunner = {
          enabled = true;
          default_method = "molten";
          ft_runners = {
              quarto = "markdown";
          };
        };
      };
    };
    jupytext = {
      enable = true;
      settings = {
        extension = "md";
        style = "markdown";
        force_ft = "markdown";
        custom_language_formatting = {
          python = {
            extension = "md";
            style = "markdown";
            force_ft = "markdown";
          };
        };
      };
    };

    otter.enable = true;
    image.enable = true;
  };
  
  keymaps = [
    { mode = "n"; key = "<leader>ccprc";       action = ''<cmd>lua require("quarto.runner").run_cell()<CR>'';        options = { desc = "run cell"; silent = true; }; }
    { mode = "n"; key = "<leader>ccpra";       action = ''<cmd>lua require("quarto.runner").run_above()<CR>'';       options = { desc = "run cell and above"; silent = true; }; }
    { mode = "n"; key = "<leader>ccprA";       action = ''<cmd>lua require("quarto.runner").run_all()<CR>'';         options = { desc = "run all cells"; silent = true; }; }
    { mode = "v"; key = "<leader>ccpr";        action = ''<cmd>lua require("quarto.runner")runner.run_range()<CR>''; options = { desc = "run visual range"; silent = true; }; }
    { mode = "n"; key = "<leader>ccprl";       action = ''<cmd>lua require("quarto.runner").run_line()<CR>'';        options = { desc = "run line"; silent = true; }; }
    { mode = "n"; key = "<leader>ccpRA";       action = ''<cmd>lua require("quarto.runner").run_all(true)<CR>'';     options = { desc = "run all cells of all languages"; silent = true; }; }

    { mode = "n"; key = "<leader>ccpe";     action = "<cmd>MoltenEvaluateOperator<cr>";       options = { silent = true; desc = "evaluate operator"; }; }
    { mode = "v"; key = "<leader>ccpe";     action = "<cmd><C-u>MoltenEvaluateVisual<cr>gv";  options = { silent = true; desc = "execute visual selection"; }; }
    { mode = "n"; key = "<leader>ccp<cr>";  action = "<cmd>MoltenReevaluateCell<cr>";         options = { silent = true; desc = "re-eval cell"; }; }
    { mode = "n"; key = "<leader>ccpo";     action = "<cmd>noautocmd MoltenEnterOutput<cr>";  options = { silent = true; desc = "open output window"; }; }
    { mode = "n"; key = "<leader>ccpq";     action = "<cmd>MoltenHideOutput<cr>";             options = { silent = true; desc = "close output window"; }; }
    { mode = "n"; key = "<leader>ccpdd";    action = "<cmd>MoltenDelete<cr>";                 options = { silent = true; desc = "delete Molten cell"; }; }
  ]; }
