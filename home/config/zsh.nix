{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    theme = {
      colorful = true;

      filekinds = {
        normal = {
          foreground = "#c0caf5";
        };
        directory = {
          foreground = "#7aa2f7";
        };
        symlink = {
          foreground = "#2ac3de";
        };
        pipe = {
          foreground = "#414868";
        };
        block_device = {
          foreground = "#e0af68";
        };
        char_device = {
          foreground = "#e0af68";
        };
        socket = {
          foreground = "#414868";
        };
        special = {
          foreground = "#9d7cd8";
        };
        executable = {
          foreground = "#9ece6a";
        };
        mount_point = {
          foreground = "#b4f9f8";
        };
      };

      perms = {
        user_read = {
          foreground = "#2ac3de";
        };
        user_write = {
          foreground = "#bb9af7";
        };
        user_execute_file = {
          foreground = "#9ece6a";
        };
        user_execute_other = {
          foreground = "#9ece6a";
        };
        group_read = {
          foreground = "#2ac3de";
        };
        group_write = {
          foreground = "#ff9e64";
        };
        group_execute = {
          foreground = "#9ece6a";
        };
        other_read = {
          foreground = "#2ac3de";
        };
        other_write = {
          foreground = "#ff007c";
        };
        other_execute = {
          foreground = "#9ece6a";
        };
        special_user_file = {
          foreground = "#ff007c";
        };
        special_other = {
          foreground = "#db4b4b";
        };
        attribute = {
          foreground = "#737aa2";
        };
      };

      size = {
        major = {
          foreground = "#2ac3de";
        };
        minor = {
          foreground = "#9d7cd8";
        };
        number_byte = {
          foreground = "#a9b1d6";
        };
        number_kilo = {
          foreground = "#89ddff";
        };
        number_mega = {
          foreground = "#2ac3de";
        };
        number_giga = {
          foreground = "#ff9e64";
        };
        number_huge = {
          foreground = "#ff007c";
        };
        unit_byte = {
          foreground = "#a9b1d6";
        };
        unit_kilo = {
          foreground = "#89ddff";
        };
        unit_mega = {
          foreground = "#2ac3de";
        };
        unit_giga = {
          foreground = "#ff9e64";
        };
        unit_huge = {
          foreground = "#ff007c";
        };
      };

      users = {
        user_you = {
          foreground = "#3d59a1";
        };
        user_root = {
          foreground = "#bb9af7";
        };
        user_other = {
          foreground = "#2ac3de";
        };
        group_yours = {
          foreground = "#89ddff";
        };
        group_root = {
          foreground = "#bb9af7";
        };
        group_other = {
          foreground = "#c0caf5";
        };
      };

      links = {
        normal = {
          foreground = "#89ddff";
        };
        multi_link_file = {
          foreground = "#2ac3de";
        };
      };

      git = {
        new = {
          foreground = "#9ece6a";
        };
        modified = {
          foreground = "#bb9af7";
        };
        deleted = {
          foreground = "#db4b4b";
        };
        renamed = {
          foreground = "#2ac3de";
        };
        typechange = {
          foreground = "#2ac3de";
        };
        ignored = {
          foreground = "#545c7e";
        };
        conflicted = {
          foreground = "#ff9e64";
        };
      };

      git_repo = {
        branch_main = {
          foreground = "#737aa2";
        };
        branch_other = {
          foreground = "#b4f9f8";
        };
        git_clean = {
          foreground = "#292e42";
        };
        git_dirty = {
          foreground = "#bb9af7";
        };
      };

      security_context = {
        colon = {
          foreground = "#545c7e";
        };
        user = {
          foreground = "#737aa2";
        };
        role = {
          foreground = "#2ac3de";
        };
        typ = {
          foreground = "#3d59a1";
        };
        range = {
          foreground = "#9d7cd8";
        };
      };

      file_type = {
        image = {
          foreground = "#89ddff";
        };
        video = {
          foreground = "#b4f9f8";
        };
        music = {
          foreground = "#73daca";
        };
        lossless = {
          foreground = "#41a6b5";
        };
        crypto = {
          foreground = "#db4b4b";
        };
        document = {
          foreground = "#a9b1d6";
        };
        compressed = {
          foreground = "#ff9e64";
        };
        temp = {
          foreground = "#737aa2";
        };
        compiled = {
          foreground = "#737aa2";
        };
        build = {
          foreground = "#1abc9c";
        };
        source = {
          foreground = "#bb9af7";
        };
      };

      punctuation = {
        foreground = "#292e42";
      };
      date = {
        foreground = "#e0af68";
      };
      inode = {
        foreground = "#737aa2";
      };
      blocks = {
        foreground = "#737aa2";
      };
      header = {
        foreground = "#a9b1d6";
      };
      octal = {
        foreground = "#ff9e64";
      };
      flags = {
        foreground = "#9d7cd8";
      };

      symlink_path = {
        foreground = "#89ddff";
      };
      control_char = {
        foreground = "#ff9e64";
      };
      broken_symlink = {
        foreground = "#ff007c";
      };
      broken_path_overlay = {
        foreground = "#ff007c";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--layout=reverse"
      "--border=none"
    ];
    colors = {
      "bg+" = "#283457";
      "bg" = "#16161e";
      "border" = "#27a1b9";
      "fg" = "#c0caf5";
      "gutter" = "#16161e";
      "header" = "#ff9e64";
      "hl+" = "#2ac3de";
      "hl" = "#2ac3de";
      "info" = "#545c7e";
      "marker" = "#ff007c";
      "pointer" = "#ff007c";
      "prompt" = "#2ac3de";
      "query" = "#c0caf5:regular";
      "scrollbar" = "#27a1b9";
      "separator" = "#ff9e64";
      "spinner" = "#ff007c";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    initContent = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      # Keybinds
      bindkey -e
      bindkey '^[[H' beginning-of-line      # Home key
      bindkey '^[[F' end-of-line            # End key
      bindkey '^[[3~' delete-char           # Delete key
      bindkey '^[[1;5D' backward-word       # Ctrl + Left
      bindkey '^[[1;5C' forward-word        # Ctrl + Right

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
    setOptions = [
      "auto_menu"
      "extendedglob"
      "auto_param_slash"
      "no_case_glob"
      "no_case_match"
      "globdots"
      "interactive_comments"
    ];
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    completionInit = ''
      autoload -Uz colors && colors
      autoload -U select-word-style && select-word-style bash

      # cmp opts
      zstyle ':completion:*' menu select # tab opens cmp menu
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
      zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
    '';
    shellAliases = {
      lg = "lazygit";
      ls = "eza -a --icons=auto --color=always";
      ll = "eza -la --icons=auto --color=always";
      lt = "eza -Ta --icons=auto --color=always";
    };
  };
}
