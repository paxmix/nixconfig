{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    shellAbbrs = {
      lg = "lazygit";
      ls = "eza -a --icons=auto --color=always";
      ll = "eza -la --icons=auto --color=always";
      lt = "eza -Ta --icons=auto --color=always";
    };

    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];

    interactiveShellInit = ''
      set -g fish_greeting # Clear the welcome message

      set -g hydro_color_pwd "7aa2f7"
      set -g hydro_color_git "bb9af7"
      set -g hydro_color_error "f7768e"
      set -g hydro_color_prompt "9ece6a"
      set -g hydro_color_duration "e0af68"
      set -g hydro_symbol_prompt "󰘧"
      set -g hydro_cmd_duration_threshold 5000
    '';
  };
}
