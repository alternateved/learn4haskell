let pkgs = import ./packages.nix { };
in pkgs.haskell.packages.ghc8107.callCabal2nix "learn4haskell" ./. { }
