{ pkgs ? import <nixpkgs> { }, overrides ? (self: super: { }) }:

with pkgs;

let
  packages = self:
    let callPackage = newScope self;
    in {
      multimc-cracked = libsForQt5.callPackage ./multimc-cracked { };
    };
in lib.fix (lib.extends overrides packages)
