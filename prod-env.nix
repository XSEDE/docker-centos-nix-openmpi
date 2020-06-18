with import <nixpkgs> { };
{ openmpiProdEnv = buildEnv {
  name = "openmpi-prod-env";
  paths = [
    # Always include nix, or environment will break
    # Include bash for base OSes without bash
    nix
    bash
    
    # MPI-related packages
    binutils
    gfortran
    openmpi
    
    ];
  };
}

