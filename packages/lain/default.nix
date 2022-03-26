{ stdenv
, lua
, pkgs
, lib
}:

stdenv.mkDerivation {
  name = "lain";
  version = "nightly";

  src = pkgs.fetchFromGitHub {
    owner = "lcpz";
    repo = "lain";
    rev = "0df20e38bbd047c1afea46ab25e8ecf758bb5d45";
    sha256 = "sha256-SjlUbiWdLQrxhNIB7p9JvQGwxwcu/4f9LtwjW+LNu78=";
  };

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/lain/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/?/init.lua;' ..  package.path\nreturn require((...))\n" > $out/lib/lua/${lua.luaversion}/lain.lua
  '';

  meta = with lib; {
    description = "Awesome WM complements";
    homepage = "https://github.com/lcpz/lain";
    platforms = platforms.linux;
  };
}
