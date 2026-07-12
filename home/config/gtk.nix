{ pkgs, ... }:
{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Adwaita";
      size = 24;
      package = pkgs.adwaita-icon-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # 2. Dconf settings for Dark Mode and Terminal
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/default-applications/terminal" = {
      exec = "ghostty";
    };
  };
}
