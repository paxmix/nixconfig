{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    imports = [
      ./options.nix
      ./keymaps.nix
    ];

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night"; # Standard LazyVim default
    };

    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          appearance.use_nvim_cmp_as_default = true;
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          signature.enabled = true;
        };
      };
      luasnip.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          lua_ls.enable = true;
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "gI" = "implementation";
          "K" = "hover";
        };
      };
      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
          };
        };
      };

      fzf-lua = {
        enable = true;
        keymaps = {
          "<leader><space>" = "files"; # Find files
          "<leader>/" = "live_grep"; # Grep project
          "<leader>," = "buffers"; # Switch buffers
        };
      };

      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        window.position = "left";
      };

      bufferline = {
        enable = true;
        settings.options.diagnostics = "nvim_lsp";
      };

      lualine.enable = true;

      noice.enable = true;
      notify.enable = true; # Visual notifications backend for Noice

      gitsigns.enable = true;

      flash.enable = true;
      which-key = {
        enable = true;
        settings.spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = "file/find";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "git";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "code";
          }
        ];
      };

      # Visual indent scope lines
      mini = {
        enable = true;
        modules = {
          indentscope = {
            symbol = "│";
            options.try_as_border = true;
          };
          pairs = { };
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
