{ pkgs, ... }: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
        golangci_lint_ls.enable = true;
        html.enable = true;
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
        format_on_save = ''
          function(bufnr)
            -- If the filetype is HTML, return nil/nothing to disable formatting
            if vim.bo[bufnr].filetype == "html" then
              return
            end

            -- For all other languages, format normally
            return {
              timeout_ms = 500,
              lsp_format = "fallback",
            }
          end
        '';
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
