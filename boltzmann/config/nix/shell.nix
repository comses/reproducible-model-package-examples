let nixpkgs = import ./pinned.nix; 
mesa = with (nixpkgs.lib.mergeAttrs nixpkgs.pkgs.python36Packages { stdenv = nixpkgs.stdenv; }); callPackage ./mesa.nix { };
p = nixpkgs.pkgs.python36Packages;
in 
nixpkgs.stdenv.mkDerivation {
  name = "boltzmann-model";
  buildInputs = [
    p.networkx
    p.matplotlib
    mesa
  ];
}
