{
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    outputs = { self, nixpkgs }:
      let 
      pkgs = import nixpkgs {
          system = "x86_64-linux";
      };
    in {
        defaultPackage."x86_64-linux" = pkgs.llvmPackages_13.stdenv.mkDerivation {
            name = "test";
            src = ./.;
            buildInputs = [ pkgs.boehmgc ];
            buildPhase = ''
                clang++ -fsanitize=address -o test main.cpp
            '';
            installPhase = ''
                cp test $out
            '';
        };
    };
}