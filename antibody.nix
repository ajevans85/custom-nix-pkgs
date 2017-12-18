with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "antibody-3.1.4";
  src = fetchurl {
    url = "https://github.com/getantibody/antibody/releases/download/v3.1.4/antibody_Darwin_x86_64.tar.gz";
    sha256 = "6b5a69e4890f65498cd6f2fb0e0a7c0a2abc62b74f5c25e1d17b3ac2a228f266";
  };

  meta = {
    homepage = "https://getantibody.github.io/";
    description = "The fastest shell plugin manager. A faster and simpler antigen written in Golang.";
    platforms = stdenv.lib.platforms.darwin;
  };

  # Work around the "unpacker appears to have produced no directories"
  # case that happens when the archive doesn't have a subdirectory.
  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    cp antibody $out/bin
  '';
}
