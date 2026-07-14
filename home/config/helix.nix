{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.helix;
    defaultEditor = true;
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        color-modes = true;
        end-of-line-diagnostics = "hint";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
        };

        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };

        statusline = {
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        inline-diagnostics = {
          cursor-line = "warning";
        };
      };

      keys = {
        insert = {
          "j" = {
            "k" = "normal_mode";
          };
          "C-e" = [
            "goto_line_end"
            "move_char_right"
          ];
          "C-a" = "goto_line_start";
        };

        normal = {
          "}" = "goto_next_paragraph";
          "{" = "goto_prev_paragraph";
          "H" = "goto_previous_buffer";
          "L" = "goto_next_buffer";
        };

        select = {
          "}" = "goto_next_paragraph";
          "{" = "goto_prev_paragraph";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
        {
          name = "go";
          auto-format = true;
          formatter = {
            command = "gofmt";
          };
        }
        {
          name = "html";
          auto-format = false;
          file-types = [
            "html"
            "tmpl"
          ];
        }
        {
          name = "rust";
          scope = "source.rust";
          injection-regex = "rs|rust";
          file-types = [ "rs" ];
          roots = [
            "Cargo.toml"
            "Cargo.lock"
          ];
          shebangs = [
            "rust-script"
            "cargo"
          ];
          auto-format = true;
          comment-tokens = [
            "//"
            "///"
            "//!"
          ];
          block-comment-tokens = [
            {
              start = "/*";
              end = "*/";
            }
            {
              start = "/**";
              end = "*/";
            }
            {
              start = "/*!";
              end = "*/";
            }
          ];
          language-servers = [ "rust-analyzer" ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          persistent-diagnostic-sources = [
            "rustc"
            "clippy"
          ];
          auto-pairs = {
            "(" = ")";
            "{" = "}";
            "[" = "]";
            "\"" = "\"";
            "`" = "`";
            "<" = ">";
          };
        }
      ];

      language-server.rust-analyzer = {
        command = "rust-analyzer";
        config = {
          inlayHints = {
            bindingModeHints.enable = false;
            closingBraceHints.minLines = 10;
            closureReturnTypeHints.enable = "with_block";
            discriminantHints.enable = "fieldless";
            lifetimeElisionHints.enable = "skip_trivial";
            typeHints.hideClosureInitialization = false;
          };
          files.watcher = "server";
          check.command = "clippy";
        };
      };
    };

    extraPackages = with pkgs; [
      nixd
      nixfmt

      gopls
      delve
      golangci-lint
      golangci-lint-langserver
      gofumpt
      vscode-langservers-extracted
    ];
  };
}
