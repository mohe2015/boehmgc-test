{
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    outputs = { self, nixpkgs }:
      let 
      pkgs = import nixpkgs {
          system = "x86_64-linux";
      };
    in {
        # nix -L build && ASAN_OPTIONS=fast_unwind_on_malloc=0 ./result/test
        # (genericBuild) && ./outputs/out/test
        defaultPackage."x86_64-linux" = pkgs.stdenv.mkDerivation { # llvmPackages_13
            name = "test";
            src = ./.;
            nativeBuildInputs = [ pkgs.bashInteractive ]; # pkgs.llvm_13
            buildInputs = [ 

            ((pkgs.boehmgc.override {
              enableLargeConfig = true;
            }).overrideAttrs(o: rec {
              version = "8.2.0";

              src = pkgs.fetchurl {
                urls = [
                  "https://github.com/ivmai/bdwgc/releases/download/v${version}/gc-${version}.tar.gz"
                  "https://www.hboehm.info/gc/gc_source/gc-${version}.tar.gz"
                ];
                sha256 = "sha256-JUD3NWy3T2xbdTJsbTigZu3XljYf19TtJuSU2YVv7Y8=";
              };

              configureFlags = [ "--enable-cplusplus" "--enable-gc-debug" ];

              preConfigure = ''
                export NIX_CFLAGS_COMPILE+=" -DKEEP_BACK_PTRS"
              '';
            }))

            ];
            dontStrip = true;
            installPhase = ''
                mkdir -p $out
                cp liblib.so $out/
                cp test $out/
            '';
        };
    };
}
