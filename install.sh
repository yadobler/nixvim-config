#! /bin/sh
nix build -o nvim_result
nix profile remove nixvim 
nix profile install ./nvim_result
rm ./nvim_result
