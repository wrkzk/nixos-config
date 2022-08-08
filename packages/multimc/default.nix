{ lib
, pkgs
, stdenv
, fetchFromGitHub
, cmake
, jdk8
, jdk
, zlib
, file
, makeWrapper
, xorg
, libpulseaudio
, libsForQt5
, libGL
, glfw
, openal
, msaClientID ? ""
}:

pkgs.libsForQt5.callPackage({mkDerivation}: mkDerivation) {} rec {
  name = "multimc";
  src = fetchFromGitHub {
    owner = "UltimMC";
    repo = "Launcher";
    rev = "b5e81bbb0d17e551ae4164f9282f0182c6d4edb3";
    sha256 = "sha256-NrugkjF5O9GGuv7zPlllCdr0a10bvt7A0UPL+xO4w+Q=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake file jdk makeWrapper pkgs.qt5.wrapQtAppsHook ];
  buildInputs = [ libsForQt5.qt5.qtbase zlib libsForQt5.quazip ];

  postPatch = ''
    # hardcode jdk paths
    substituteInPlace launcher/java/JavaUtils.cpp \
      --replace 'scanJavaDir("/usr/lib/jvm")' 'javas.append("${jdk}/lib/openjdk/bin/java")' \
      --replace 'scanJavaDir("/usr/lib32/jvm")' 'javas.append("${jdk8}/lib/openjdk/bin/java")'
  '';

  cmakeFlags = [ "-DLauncher_PORTABLE=0" ] ++
               lib.optionals (msaClientID != "") [ "-DLauncher_MSA_CLIENT_ID=${msaClientID}" ];

  dontWrapQtApps = true;

  postInstall = let
    libpath = with xorg; lib.makeLibraryPath [
      libX11
      libXext
      libXcursor
      libXrandr
      libXxf86vm
      libpulseaudio
      libGL
      glfw
      openal
    ];
  in ''
    sed -i '36d' $out/UltimMC
    sed -i '16 a DATA_DIR="/home/warren/.local/share/multimc"' $out/UltimMC
    sed -i '39 s/LAUNCHER_DIR}" "$@/DATA_DIR}" "$@/' $out/UltimMC
    sed -i '39 s=/bin/=/=g' $out/UltimMC


    # xorg.xrandr needed for LWJGL [2.9.2, 3) https://github.com/LWJGL/lwjgl/issues/128
    wrapProgram $out/bin/UltimMC \
      "''${qtWrapperArgs[@]}" \
      --set GAME_LIBRARY_PATH /run/opengl-driver/lib:${libpath} \
      --prefix PATH : ${lib.makeBinPath [ xorg.xrandr ]}

    mv $out/UltimMC $out/bin/multimc
  '';

  meta = with lib; {
    homepage = "https://polymc.org/";
    description = "A free, open source launcher for Minecraft";
    longDescription = ''
      Allows you to have multiple, separate instances of Minecraft (each with
      their own mods, texture packs, saves, etc) and helps you manage them and
      their associated options with a simple interface.
    '';
    platforms = platforms.linux;
    changelog = "https://github.com/PolyMC/PolyMC/releases/tag/${version}";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ cleverca22 starcraft66 ];
  };
}
