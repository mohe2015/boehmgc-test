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
            nativeBuildInputs = [ pkgs.llvm_13 ];
            buildInputs = [ pkgs.boehmgc ];
            buildPhase = ''
clang++ -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -c lib.cpp
clang++ -shared -o liblib.so lib.o
clang++ -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -c main.cpp
clang++ -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -L$PWD -Wl,-rpath=$out -llib -lgc -lgccpp -o test main.o
            '';
            installPhase = ''
                mkdir -p $out
                cp liblib.so $out/
                cp test $out/
            '';
        };
    };
}