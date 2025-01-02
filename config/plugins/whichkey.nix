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
}
