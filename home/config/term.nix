_: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "MesloLGS Nerd Font:size=12";
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
