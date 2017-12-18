with import <nixpkgs> {};

with pkgs;
stdenv.mkDerivation rec {
  name = "plantuml-${version}";
  version= "1.2017.20";
  phases = "installPhase";

  meta = {
    hompage = "http://plantuml.com/";
    description = "PlantUML is used to draw UML diagrams, using a simple and human readable text description.";
    platforms = stdenv.lib.platforms.all;
  };

  buildInputs = [ makeWrapper jre ];

  src = fetchurl {
    # Should pin to a version but can't figure out the sourceforge path with all it's redirects and 404 errors
    url = "mirror://sourceforge/plantuml/plantuml.jar";
    sha256 = "1fm4yp77kp8yjmi6kiaygrv8si8f82bbwcmx4i4wmfjfxi16vrf5";
  };

  installPhase = ''
    mkdir -p $out/share/java
    cp -v $src $out/share/java/plantuml.jar

    mkdir -p $out/bin
    makeWrapper ${jre}/bin/java $out/bin/plantuml \
      --add-flags "-jar $out/java/share/plantuml.jar"
  '';
}
