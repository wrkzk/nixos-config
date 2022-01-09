{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = '''';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      {
        plugin = nvim-tree-lua;
        config = ''
          lua << EOF
          require'nvim-tree'.setup {
            disable_netrw = true,
            hijack_netrw = true
          }
          EOF
        '';
      }
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
