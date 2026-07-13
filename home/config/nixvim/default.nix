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
      ./plugins/lsp.nix
      ./plugins/mini.nix
      ./plugins/snacks.nix
      ./plugins/trouble.nix
      ./plugins/treesitter.nix
      ./plugins/gitsign.nix
    ];

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({
                higroup = "IncSearch", 
                timeout = 150,        
              })
            end
          '';
        };
      }
      {
        event = [ "BufReadPost" ];
        callback = {
          __raw = ''
            function()
              local mark = vim.api.nvim_buf_get_mark(0, '"')
              local lcount = vim.api.nvim_buf_line_count(0)
              if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
              end
            end
          '';
        };
      }
    ];

    plugins = {
      luasnip.enable = true;
      flash.enable = true;
      which-key.enable = true;
    };

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  };
}
