{ pkgs, ... }:

let
  extensions = (with pkgs.vscode-extensions; []) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscode;
    vscodeExtensions = extensions;
  };
in {
  home.packages = [
    vscode-with-extensions
  ];
}
