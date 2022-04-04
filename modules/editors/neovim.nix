{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = ''
      set relativenumber
      set mouse=a
      set termguicolors
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      barbar-nvim
      {
        plugin = nvim-web-devicons;
        config = ''
          lua << EOF
          require'nvim-web-devicons'.setup()
          EOF
        '';
      }
      {
        plugin = lualine-nvim;
        config = ''
          lua << EOF
          require('lualine').setup {
            options = {
              icons_enabled = true,
              theme = 'auto'
            }
          }
          EOF
        '';
      }
      {
        plugin = presence-nvim;
        config = ''
          lua << EOF
          require("presence"):setup({
            auto_update = true
          })
          EOF
        '';
      }
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
        plugin = tokyonight-nvim;
        config = ''
          set termguicolors
          let g:tokyonight_style = "night"
          colorscheme tokyonight
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
