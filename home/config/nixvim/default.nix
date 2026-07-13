{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    imports = [
      ./options.nix
      ./keymaps.nix
      ./plugins/blink.nix
      ./plugins/bufferline.nix
      ./plugins/lualine.nix
      ./plugins/lsp.nix
      ./plugins/mini.nix
      ./plugins/snacks.nix
    ];

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {
      luasnip.enable = true;

      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };

      gitsigns.enable = true;

      flash.enable = true;

      which-key.enable = true;

      web-devicons = {
        enable = true;
        autoLoad = true;
        settings = {
          color_icons = true;
          strict = true;
        };
      };
    };

    extraPackages = with pkgs; [
      ripgrep
      fd
      nixfmt
    ];
  };
}
