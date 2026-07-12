{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    theme = {
      colorful = true;

      filekinds = {
        normal = {
          foreground = "#ebdbb2";
        };
        directory = {
          foreground = "#83a598";
        };
        symlink = {
          foreground = "#8ec07c";
        };
        pipe = {
          foreground = "#928374";
        };
        block_device = {
          foreground = "#fb4934";
        };
        char_device = {
          foreground = "#fb4934";
        };
        socket = {
          foreground = "#665c54";
        };
        special = {
          foreground = "#d3869b";
        };
        executable = {
          foreground = "#b8bb26";
        };
        mount_point = {
          foreground = "#fe8019";
        };
      };

      perms = {
        user_read = {
          foreground = "#ebdbb2";
        };
        user_write = {
          foreground = "#fabd2f";
        };
        user_execute_file = {
          foreground = "#b8bb26";
        };
        user_execute_other = {
          foreground = "#b8bb26";
        };
        group_read = {
          foreground = "#ebdbb2";
        };
        group_write = {
          foreground = "#fabd2f";
        };
        group_execute = {
          foreground = "#b8bb26";
        };
        other_read = {
          foreground = "#bdae93";
        };
        other_write = {
          foreground = "#fabd2f";
        };
        other_execute = {
          foreground = "#b8bb26";
        };
        special_user_file = {
          foreground = "#d3869b";
        };
        special_other = {
          foreground = "#928374";
        };
        attribute = {
          foreground = "#bdae93";
        };
      };

      size = {
        major = {
          foreground = "#bdae93";
        };
        minor = {
          foreground = "#8ec07c";
        };
        number_byte = {
          foreground = "#ebdbb2";
        };
        number_kilo = {
          foreground = "#ebdbb2";
        };
        number_mega = {
          foreground = "#83a598";
        };
        number_giga = {
          foreground = "#d3869b";
        };
        number_huge = {
          foreground = "#d3869b";
        };
        unit_byte = {
          foreground = "#bdae93";
        };
        unit_kilo = {
          foreground = "#83a598";
        };
        unit_mega = {
          foreground = "#d3869b";
        };
        unit_giga = {
          foreground = "#d3869b";
        };
        unit_huge = {
          foreground = "#fe8019";
        };
      };

      users = {
        user_you = {
          foreground = "#ebdbb2";
        };
        user_root = {
          foreground = "#fb4934";
        };
        user_other = {
          foreground = "#d3869b";
        };
        group_yours = {
          foreground = "#ebdbb2";
        };
        group_other = {
          foreground = "#928374";
        };
        group_root = {
          foreground = "#fb4934";
        };
      };

      links = {
        normal = {
          foreground = "#8ec07c";
        };
        multi_link_file = {
          foreground = "#fe8019";
        };
      };

      git = {
        new = {
          foreground = "#b8bb26";
        };
        modified = {
          foreground = "#fabd2f";
        };
        deleted = {
          foreground = "#fb4934";
        };
        renamed = {
          foreground = "#8ec07c";
        };
        typechange = {
          foreground = "#d3869b";
        };
        ignored = {
          foreground = "#928374";
        };
        conflicted = {
          foreground = "#cc241d";
        };
      };

      git_repo = {
        branch_main = {
          foreground = "#ebdbb2";
        };
        branch_other = {
          foreground = "#d3869b";
        };
        git_clean = {
          foreground = "#b8bb26";
        };
        git_dirty = {
          foreground = "#fb4934";
        };
      };

      security_context = {
        colon = {
          foreground = "#928374";
        };
        user = {
          foreground = "#ebdbb2";
        };
        role = {
          foreground = "#d3869b";
        };
        typ = {
          foreground = "#665c54";
        };
        range = {
          foreground = "#d3869b";
        };
      };

      file_type = {
        image = {
          foreground = "#fabd2f";
        };
        video = {
          foreground = "#fb4934";
        };
        music = {
          foreground = "#b8bb26";
        };
        lossless = {
          foreground = "#8ec07c";
        };
        crypto = {
          foreground = "#928374";
        };
        document = {
          foreground = "#ebdbb2";
        };
        compressed = {
          foreground = "#d3869b";
        };
        temp = {
          foreground = "#cc241d";
        };
        compiled = {
          foreground = "#83a598";
        };
        build = {
          foreground = "#928374";
        };
        source = {
          foreground = "#83a598";
        };
      };

      punctuation = {
        foreground = "#928374";
      };
      date = {
        foreground = "#fabd2f";
      };
      inode = {
        foreground = "#bdae93";
      };
      blocks = {
        foreground = "#a89984";
      };
      header = {
        foreground = "#ebdbb2";
      };
      octal = {
        foreground = "#8ec07c";
      };
      flags = {
        foreground = "#d3869b";
      };

      symlink_path = {
        foreground = "#8ec07c";
      };
      control_char = {
        foreground = "#83a598";
      };
      broken_symlink = {
        foreground = "#fb4934";
      };
      broken_path_overlay = {
        foreground = "#928374";
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
    colors = {
      "bg+" = "#3c3836";
      "bg" = "#282828";
      "spinner" = "#d8a657";
      "hl" = "#ea6962";
      "fg" = "#d4be98";
      "header" = "#a9b665";
      "info" = "#89b482";
      "pointer" = "#d8a657";
      "marker" = "#7daea3";
      "fg+" = "#ddc7a1";
      "prompt" = "#a9b665";
      "hl+" = "#ea6962";
      "selected-bg" = "#504945";
      "border" = "#665c54";
      "label" = "#d4be98";
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
