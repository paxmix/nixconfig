_: {
  programs.foot = {
    enable = true;
    theme = "tokyonight-night";
    xdg.serverAutostart = true;
    settings = {
      main = {
        font = "Hack Nerd Font:size=12";
        pad = "8x8 center-when-maximized-and-fullscreen";
      };
      bell = {
        system = false;
      };
      scrollback = {
        lines = 10000;
      };
      mouse = {
        hide-when-typing = true;
      };
      colors-dark = {
        alpha = 0.9;
      };
    };
  };
}
