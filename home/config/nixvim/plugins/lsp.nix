{ pkgs, ... }: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
        golangci_lint_ls.enable = true;
      };
      keymaps = {
        lspBuf = {
          "K" = "hover";
          "<leader>cr" = "rename";
          "<leader>ca" = "code_action";
          "<leader>cf" = "references";
          "<leader>cs" = "format";
        };
        diagnostic = {
          "<leader>cd" = "open_float";
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
        formatters_by_ft = {
          go = [ "goimports" ];
          nix = [ "nixfmt" ];
        };
      };
    };

    lint = {
      enable = true;
      lintersByFt = {
        nix = [ "statix" ];
      };
      autoCmd.event = [ "BufWritePost" ];
    };
  };

  extraPackages = with pkgs; [
    statix
    nixfmt

    golangci-lint
    gotools
  ];
}
