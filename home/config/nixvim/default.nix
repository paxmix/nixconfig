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

      # fzf-lua = {
      #   enable = true;
      #   keymaps = {
      #     "<leader><space>" = "files";
      #     "<leader>/" = "live_grep";
      #     "<leader>," = "buffers";
      #   };
      # };

      # neo-tree = {
      #   enable = true;
      #   settings = {
      #     close_if_last_window = true;
      #     window.position = "right";
      #   };
      # };

      gitsigns.enable = true;

      flash.enable = true;

      which-key.enable = true;
    };

    web-devicons = {
      enable = true;
      autoLoad = true;
      settings = {
        color_icons = true;
        strict = true;
      };
    };

    extraPackages = with pkgs; [
      ripgrep
      fd
      nixfmt
    ];
  };
}
