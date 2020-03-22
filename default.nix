with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "sia";
 
  src = ./Sia-v1.4.4-linux-amd64.tar.gz;
 
  phases = [ "unpackPhase" "installPhase" ];
 
  installPhase = ''
    mkdir -p $out/bin

    cp siac $out/bin/siac.wrapped
    echo $(< $NIX_CC/nix-support/dynamic-linker) $out/bin/siac.wrapped \"\$@\" > $out/bin/siac
    chmod +x $out/bin/siac

    cp siad $out/bin/siad.wrapped
    echo $(< $NIX_CC/nix-support/dynamic-linker) $out/bin/siad.wrapped \"\$@\" > $out/bin/siad
    chmod +x $out/bin/siad
  '';
}
