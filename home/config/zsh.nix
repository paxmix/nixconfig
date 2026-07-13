{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
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
