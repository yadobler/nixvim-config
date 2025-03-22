{ pkgs, ... }:
{
  plugins.lsp.servers.hyprls = {
    enable = true;
    filetype = ["*.hl" "hypr*.conf"];
  };

}
