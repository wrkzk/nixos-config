{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "aerial-sddm-theme";
  src = fetchFromGitHub {
    owner = "3ximus";
    repo = " aerial-sddm-theme";
    rev = "06beb74994935743e0fae9413160d3ee936d4bf2";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/aerial-sddm-theme
    mv * $out/share/sddm/themes/aerial-sddm-theme
  '';
}
