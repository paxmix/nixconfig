{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    imports = [
      ./autocmds.nix
      ./options.nix
      ./keymaps.nix
      ./plugins/blink.nix
      ./plugins/bufferline.nix
      ./plugins/lsp.nix
      ./plugins/mini.nix
      ./plugins/snacks.nix
      ./plugins/trouble.nix
      ./plugins/treesitter.nix
      ./plugins/gitsign.nix
    ];

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        styles = {
          keywords = {
            italic = false;
          };
        };
      };
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {
      flash.enable = true;
      which-key.enable = true;
    };

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  };
}
