{ pkgs, ... }:
let
  flake = "~/.config/nixos";
in
{
  plugins = {
    nix.enable = true;
    nix-develop.enable = true;
    lsp.servers.nil_ls.enable = true;
  };

  extraConfigVim = ''
    au BufRead,BufNewFile flake.lock setf json
  '';
}
