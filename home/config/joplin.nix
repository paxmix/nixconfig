_: {
  programs.joplin-desktop = {
    enable = true;
    sync.target = "dropbox";
    sync.interval = "30m";
  };
}
