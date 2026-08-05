_: {
  programs.fish = {
    enable = true;

    shellAbbrs = {
      ls = "eza -a --icons=auto --color=always";
      ll = "eza -la --icons=auto --color=always";
      lt = "eza -Ta --icons=auto --color=always";
    };

    interactiveShellInit = ''
      set -g fish_greeting # Clear the welcome message
    '';

    shellInitLast = ''
      function prompt_newline --on-event fish_postexec
        echo
      end
      alias clear "command clear; commandline -f clear-screen"
    '';
  };
}
