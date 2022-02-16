{ inputs }:

final: prev: {
  multimc = prev.callPackage ./multimc {};
}
