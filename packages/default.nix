{ pkgs ? import <nixpkgs> { }, overrides ? (self: super: { }) }:

with pkgs;

let
  packages = self:
    let callPackage = newScope self;
    in {
      multimc-cracked = libsForQt5.callPackage ./multimc-cracked {};
      mathematica-latest = callPackage ./mathematica {};
      bling = callPackage ./bling {};
      rubato = callPackage ./rubato {};
      lain = callPackage ./lain {};
      bwsi-grader = callPackage ./bwsi-grader {};
    };
in lib.fix (lib.extends overrides packages)
