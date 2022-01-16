{ config, pkgs, ... }:

with pkgs;
let
  python-packages = python-packages: with python-packages; [
    protobuf
  ];
  custom-python = python3.withPackages python-packages
in
{
  home.packages = with pkgs; [
    custom-python
  ];
}
