#! /bin/sh
set -xe
nix build -o nvim_result
set +xe
nix profile remove nixvim 
nix profile install ./nvim_result
rm ./nvim_result
