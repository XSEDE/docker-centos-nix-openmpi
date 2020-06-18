with import <nixpkgs> {};
#let
#  TODO: ...osu-micro-benchmarks...
#in
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
