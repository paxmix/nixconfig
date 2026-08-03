_: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
    kvantum = {
      enable = true;
      settings.General.theme = "KvGnomeDark";
    };

    qt5ctSettings = {
      Appearance = {
        icon_theme = "Papirus-Dark";
        style = "kvantum";
      };
      Fonts = {
        fixed = "\"Meslo LG S,12\"";
        general = "\"Inter,12\"";
      };
    };
    qt6ctSettings = {
      Appearance = {
        icon_theme = "Papirus-Dark";
        style = "kvantum";
      };
      Fonts = {
        fixed = "\"Meslo LG S,12\"";
        general = "\"Inter,12\"";
      };
    };
  };
}
