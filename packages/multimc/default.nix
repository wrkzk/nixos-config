{ lib, mkDerivation, fetchFromGitHub, cmake, jdk8, jdk, zlib, file, makeWrapper, xorg, libpulseaudio, qtbase, libGL, msaClientID ? "" }:

let
  libpath = with xorg; lib.makeLibraryPath [ libX11 libXext libXcursor libXrandr libXxf86vm libpulseaudio libGL ];
in mkDerivation rec {
  pname = "multimc";
  version = "unstable-2021-09-08";
  src = fetchFromGitHub {
    owner = "AfoninZ";
    repo = "UltimMC";
    rev = "99fa82c05ebd301ed1a1f5e63dd20ac868348b42";
    sha256 = "";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [ cmake file makeWrapper ];
  buildInputs = [ qtbase jdk8 zlib ];

  patches = [ ./0001-pick-latest-java-first.patch ];

  postPatch = ''
    # hardcode jdk paths
    substituteInPlace launcher/java/JavaUtils.cpp \
      --replace 'scanJavaDir("/usr/lib/jvm")' 'javas.append("${jdk}/lib/openjdk/bin/java")' \
      --replace 'scanJavaDir("/usr/lib32/jvm")' 'javas.append("${jdk8}/lib/openjdk/bin/java")'
    # add client ID
    substituteInPlace notsecrets/Secrets.cpp \
      --replace 'QString MSAClientID = "";' 'QString MSAClientID = "${msaClientID}";'
  '';

  cmakeFlags = [ "-DMultiMC_LAYOUT=lin-system" ];

  postInstall = ''
    # install -Dm644 ../launcher/resources/multimc/scalable/multimc.svg $out/share/pixmaps/multimc.svg
    # install -Dm755 ../launcher/package/linux/multimc.desktop $out/share/applications/multimc.desktop
    # xorg.xrandr needed for LWJGL [2.9.2, 3) https://github.com/LWJGL/lwjgl/issues/128
    wrapProgram $out/bin/multimc \
      --set GAME_LIBRARY_PATH /run/opengl-driver/lib:${libpath} \
      --prefix PATH : ${lib.makeBinPath [ xorg.xrandr ]}
  '';

  meta = with lib; {
    homepage = "https://multimc.org/";
    description = "A free, open source launcher for Minecraft";
    longDescription = ''
      Allows you to have multiple, separate instances of Minecraft (each with their own mods, texture packs, saves, etc) and helps you manage them and their associated options with a simple interface.
    '';
    platforms = platforms.linux;
    license = licenses.asl20;
    # upstream don't want us to re-distribute this application:
    # https://github.com/NixOS/nixpkgs/issues/131983
    hydraPlatforms = [];
    maintainers = with maintainers; [ cleverca22 starcraft66 ];
  };
}
