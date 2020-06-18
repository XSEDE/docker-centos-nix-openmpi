with import <nixpkgs> {};
let
  osu-micro-benchmarks = stdenv.mkDerivation {
    name = "osu-micro-benchmarks";
    
    src = fetchurl {
      url = https://github.com/federatedcloud/osu-micro-benchmarks-5.6.2/releases/download/v5.6.2/osu-micro-benchmarks-5.6.2.tar.gz;
      sha256 = "14ah07y05lq29ax1zwk8x0cyj5cm7xxrk9lxvmxm6zpcclgbr4xz";
    };
    phases = "installPhase";
    
    installPhase = ''
      mkdir -p $out/
      tar -C $out/ -xzf $src
    '';
  };
in
stdenv.mkDerivation {
  name = "openmpiEnv";
  buildInputs = [
    nix
    bash
    vim
    gdb
    git
    
    # MPI-related packages
    binutils
    gfortran
    openmpi
    
    # Benchmarking
    hpl
    #osu-micro-benchmarks
  ];
  src = null;
}
