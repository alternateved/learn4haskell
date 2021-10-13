{ nixpkgs ? import (fetchTarball
  "https://github.com/NixOS/nixpkgs/archive/9bf75dd50b7b6d3ce6aaf6563db95f41438b9bdb.tar.gz")
  { } }:

let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;
  haskellTools = with haskellPackages; [
    ghc
    ghcid
    cabal-install
    hindent
    ormolu
  ];

in pkgs.mkShell {
  name = "haskellEnv";
  buildInputs = haskellTools;
  shellHook = ''
    export PS1="\[hs:\033[1;32m\]\W\[\033[0m\] ~ "
  '';
}
