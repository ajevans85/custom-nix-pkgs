with import <nixpkgs> {};

with pkgs;
stdenv.mkDerivation rec {
  name = "rename-${version}";
  version= "1.6";

  meta = {
    homepage = "http://plasmasturm.org/code/rename/";
    description = "This program renames files according to modification rules specified on the command line.";
    platforms = stdenv.lib.platforms.all;
  };

  buildInputs = [ makeWrapper perl ];

  src = fetchurl {
    url = "https://github.com/ap/rename/archive/v1.600.tar.gz";
    sha256 = "538fa908c9c2c4e7a08899edb6ddb47f7cbeb9b1a1d04e003d3c19b56fcc7f88";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp rename $out/bin
    wrapProgram $out/bin/rename --prefix PERL5LIB : "$PERL5LIB"
  '';
}
