_: {
  programs.foot = {
    enable = true;
    theme = "tokyonight-night";
    settings = {
      main = {
        font = "CommitMono Nerd Font:size=12";
        pad = "8x8 center-when-maximized-and-fullscreen";
      };
      bell = {
        system = "no";
      };
      scrollback = {
        lines = 10000;
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
