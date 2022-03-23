{ stenv
, lua
, pkgs
, lib
}:

stdenv.mkDerivation {
  name = "rubato";
  version = "nightly";

  src = pkgs.fetchFromGitHub {
    owner = "andOrlando";
    repo = "rubato";
    rev = "51b4f760c9601254f4817ac90441ccd1ad0a0616";
    sha256 = "";
  }

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/bling/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/?/init.lua;' ..  package.path\nreturn require((...))\n" > $out/lib/lua/${lua.luaversion}/bling.lua
  '';

  meta = with lib; {
    description = "Create smooth animations with a slope curve for awesomeWM"
    homepage = "https://github.com/andOrlando/rubato"
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
