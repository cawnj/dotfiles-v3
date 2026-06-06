# DataDog pup CLI (nvfetcher-generated)
{ stdenv, lib, version, src }:

stdenv.mkDerivation {
  pname = "pup";
  inherit version src;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 $src/pup $out/bin/pup
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/DataDog/pup";
    description = "DataDog CLI companion — 200+ commands across Datadog products";
    mainProgram = "pup";
    platforms = [ "aarch64-linux" "x86_64-linux" ];
  };
}
