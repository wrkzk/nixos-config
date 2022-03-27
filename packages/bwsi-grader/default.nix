{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "bwsi-grader";
  version = "1.12.0";

  src = fetchPypi {
    inherit pname version
    sha256 = "";
  };

  meta = with lib; {
    description = "A suite of auto-graders for the BWSI EdX courses.";
    license = licenses.mit;
  };
}
