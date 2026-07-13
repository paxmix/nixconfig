{ pkgs, ... }:
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "video/mp4" = [ "org.gnome.Showtime.desktop" ];
      "video/mkv" = [ "org.gnome.Showtime.desktop" ];
      "video/webm" = [ "org.gnome.Showtime.desktop" ];
      "audio/mpeg" = [ "io.bassi.Amberol.desktop" ];
      "audio/wav" = [ "io.bassi.Amberol.desktop" ];
      "audio/flac" = [ "io.bassi.Amberol.desktop" ];
      "audio/ogg" = [ "io.bassi.Amberol.desktop" ];
      "application/pdf" = [ "org.gnome.Papers.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/terminal" = [ "com.mitchellh.ghostty.desktop" ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}
