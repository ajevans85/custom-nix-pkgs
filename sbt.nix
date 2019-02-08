# This deriviation goes against nix in that it removes binning the JVM/JRE to
# use for SBT and instead will use the current system JVM.

with import <nixpkgs> {};

let
  mySbt = pkgs.sbt.overrideDerivation (oldAttrs: {
    patchPhase = '''';
  });
in mySbt
