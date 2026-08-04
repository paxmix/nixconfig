_: {
  programs = {
    nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
    };
    television = {
      enable = true;
      enableFishIntegration = false;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      changeDirWidget.options = [
        "--walker-skip .git,node_modules,target"
        "--preview 'tree -C {}'"
      ];
      historyWidget.options = [
        "--with-nth 1,3.."
        "--bind 'alt-t:change-with-nth(2..|3..|1,3..)'"
        "--bind 'ctrl-y:execute-silent(echo -n {3..} | wl-copy)+abort'"
        "--color header:italic"
        "--header 'Press CTRL-Y to copy command into clipboard'"
      ];
      fileWidget.options = [
        "--walker-skip .git,node_modules,target"
        "--preview 'bat -n --color=always {}'"
        "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
      ];
    };
  };
}
