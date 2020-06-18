with import <nixpkgs> {};
let
  osu-micro-benchmarks = stdenv.mkDerivation {
    name = "osu-micro-benchmarks";
    
    src = fetchurl {
      url = https://github.com/federatedcloud/osu-micro-benchmarks-5.6.2/releases/download/v5.6.2/osu-micro-benchmarks-5.6.2.tar.gz;
      sha256 = "164kc3xlfl7agidkj9g1bpjlls0im4m6rs411j36fk7r5nb7wbg2";
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
    osu-micro-benchmarks
  ];
  src = null;
  shellHook = ''
    export LANG=en_US.UTF-8
    ln -sfn ${hpl.out}/bin/xhpl /usr/bin
    ln -sfn ${osu-micro-benchmarks.out}/bin/* /usr/bin
  '';
}
