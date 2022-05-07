{ pkgs, ... }:

let
  extensions = with pkgs.vscode-extensions; [
    ms-vscode.cpptools
  ];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscode-fhs;
    vscodeExtensions = extensions;
  };
in {
  home.packages = [
    vscode-with-extensions
  ];
}
