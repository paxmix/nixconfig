_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
    # FZF_CTRL_T_OPTS
    fileWidget.options = [
      "--walker-skip .git,node_modules,target"
      "--preview 'bat -n --color=always {}'"
      "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
    ];
    # FZF_CTRL_R_OPTS
    historyWidget.options = [
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"
      "--color header:italic"
      "--header 'Press CTRL-Y to copy command into clipboard'"
    ];
    # FZF_ALT_C_OPTS
    changeDirWidget.options = [
      "--walker-skip .git,node_modules,target"
      "--preview 'tree -C {}'"
    ];

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
}
