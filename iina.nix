with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "iina-${version}";
  version = "0.0.12";

  src = fetchurl {
    url = "https://github.com/lhc70000/iina/releases/download/v0.0.12/IINA.v0.0.12.dmg";
    sha256 = "e563e45666a97a2c618dfcebfdfeae8ac22f6d68af0071a7b26f34458187152c";
  };

  buildInputs = [ undmg ];
  installPhase = ''
    mkdir -p "$out/Applications/IINA.app"
    cp -R . "$out/Applications/IINA.app"
    chmod +x "$out/Applications/IINA.app/Contents/MacOS/IINA"
  '';

  meta = {
    description = "The modern video player for macOS";
    homepage = https://lhc70000.github.io/iina/;
    platforms = stdenv.lib.platforms.darwin;
  };
}
