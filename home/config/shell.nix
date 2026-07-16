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
    '';
  };
}
