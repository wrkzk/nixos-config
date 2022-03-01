{ lib, pkgs, stdenv, wrapQtAppsHook, glibc, gcc-unwrapped, libsForQt5, dpkg, autoPatchelfHook}:
let

  rpath = lib.makeLibraryPath [
    gcc-unwrapped
    glibc
  ];

in stdenv.mkDerivation {

  name = "multimc";
  version = "nightly";
  system = "x86_64-linux";
  src = pkgs.fetchzip {
    url = "https://nightly.link/AfoninZ/MultiMC5-Cracked/workflows/main/develop/mmc-cracked-lin64.zip";
    sha256 = "sha256-kqCU8KxmLy3oJ5pQdtKzo1RWvUcALLzCFjnopPYjuCA=";
  };

  nativeBuildInputs = [ autoPatchelfHook wrapQtAppsHook ];
  buildInputs = [
    libsForQt5.qt5.qtbase
    gcc-unwrapped
  ];

  installPhase = ''
    mkdir -p $out/bin/
    cp -r $src/* $out/bin/
    chmod +x $out/bin/UltimMC
    chmod +x $out/bin/bin/UltimMC

    sed -i '36d' $out/bin/UltimMC
    sed -i '16 a DATA_DIR=".local/share/multimc"' $out/bin/UltimMC
    sed -i '39 s/LAUNCHER_DIR}" "$@/DATA_DIR}" "$@/' $out/bin/UltimMC
  '';

  postFixup = ''
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$out/bin/bin/UltimMC" || true
    patchelf --set-rpath ${rpath} "$out/bin/bin/UltimMC" || true

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$out/bin/UltimMC" || true
    patchelf --set-rpath ${rpath} "$out/bin/UltimMC" || true
  '';

  meta = with stdenv.lib; {
    homepage = "https://multimc.org/";
    description = "A free, open source launcher for Minecraft";
  };
}
