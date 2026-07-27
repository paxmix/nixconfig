_: {
  plugins.render-markdown = {
    enable = true;
    settings = {
      heading = {
        enabled = true;
        sign = true;
        icons = [
          "󰲡 "
          "󰲣 "
          "󰲥 "
          "󰲧 "
          "󰲩 "
          "󰲫 "
        ];
      };
      checkbox = {
        enabled = true;
        unchecked.icon = "󰄱 ";
        checked.icon = "󰱒 ";
      };
      code = {
        enabled = true;
        style = "full";
      };
    };
  };
}
