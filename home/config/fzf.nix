_: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    tmux.enableShellIntegration = true;
    # FZF_CTRL_T_OPTS
    fileWidget.options = [
      "--walker-skip .git,node_modules,target"
      "--preview 'bat -n --color=always {}'"
      "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
    ];
    # FZF_CTRL_R_OPTS
    historyWidget.options = [
      "--with-nth 1,3.."
      "--bind 'alt-t:change-with-nth(2..|3..|1,3..)'"
      "--bind 'ctrl-y:execute-silent(echo -n {3..} | wl-copy)+abort'"
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
  };
}
