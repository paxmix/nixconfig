_: {
  programs = {
    nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
    };
    television = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      changeDirWidgetOptions = [
        "--walker-skip .git,node_modules,target"
        "--preview 'tree -C {}'"
      ];
      historyWidgetOptions = [
        "--with-nth 1,3.."
        "--bind 'alt-t:change-with-nth(2..|3..|1,3..)'"
        "--bind 'ctrl-y:execute-silent(echo -n {3..} | wl-copy)+abort'"
        "--color header:italic"
        "--header 'Press CTRL-Y to copy command into clipboard'"
      ];
      fileWidgetOptions = [
        "--walker-skip .git,node_modules,target"
        "--preview 'bat -n --color=always {}'"
        "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
      ];
    };
  };
}
