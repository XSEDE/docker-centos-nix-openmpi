#!/bin/bash

if [ -z "$1" ] || [ "${1: -4}" != ".nix" ] || [ ! -f "$1" ]
  then
      echo "No .nix file supplied"
      exit -1
fi

ENV_DRV=$(nix-instantiate "$1")

# Use the following to restore an environment
nix-env --set "$ENV_DRV"

# Since nix-env --set isn't compatible with mutations like `nix-env -i foo`
# we will use this in practice instead:
nix-env -if "$1"
