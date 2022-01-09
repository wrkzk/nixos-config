{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = '''';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      {
        plugin = gruvbox-material;
        config = ''
          set termguicolors
          colorscheme gruvbox-material
        '';
      }
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
