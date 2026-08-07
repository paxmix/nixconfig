{
  pkgs,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:weight=medium:size=14";
        prompt = "'Run: '";
        icon-theme = "Papirus-Dark";
        icons-enabled = "yes";
        terminal = "${pkgs.foot}/bin/foot";
        lines = 10;
        vertical-pad = 20;
        inner-pad = 12;
        line-height = 26;
      };
      border = {
        width = 4;
        radius = 24;
      };
    };
  };
}
