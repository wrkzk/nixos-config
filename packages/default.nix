final: prev:
let
  inherit (prev) callPackage;
in
{
  multimc = callPackage ./multimc { };
}
