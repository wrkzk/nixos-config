{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = '''';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      {
        plugin = nvim-treesitter;
        config = ''
          lua << EOF
          require'nvim-treesitter.configs'.setup {
            ensure_installed = { "nix", "java" },
            highlight = {
              enable = true
            }
          }
          EOF
        '';
      }
    ];
  };
}
