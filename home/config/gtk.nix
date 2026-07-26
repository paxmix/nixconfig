{ pkgs, config, ... }:
{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.bookmarks = [
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Music"
      "file://${config.home.homeDirectory}/Videos"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Projects"
      "file://${config.home.homeDirectory}/Downloads"
    ];
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # 2. Dconf settings for Dark Mode and Terminal
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/default-applications/terminal" = {
      exec = "footclient";
    };
  };
}
