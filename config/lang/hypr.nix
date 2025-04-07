{ pkgs, ... }:
{
  plugins.lsp.servers.hyprls = {
    enable = true;
    filetypes = ["*.hl" "hypr*.conf"];
  };

}
