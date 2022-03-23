{ stdenv
, lua
, fetchFromGithHub
, pkgs
, lib
}:

stdenv.mkDerivation {
  name = "bling";
  version = "nightly"

  src = fetchFromGitHub {
    owner = "BlingCorp";
    repo = "bling";
    rev = "5b3bc36b70a35d590dedde5bfe13de4e516b64ea";
    sha256 = "";
  };

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/bling/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/?/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${lua.luaversion}/bling.lua
  '';

  meta = with lib; {
    description = "Utilities for the awesome window manager";
    homepage = "https://github.com/BlingCorp/bling";
    license = licenses.mit;
    platforms = platforms.linux;
  };
};

