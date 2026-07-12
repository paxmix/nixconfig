{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    ghostty
    curl
    wget
    unzip
    unrar
    p7zip
    ddcutil
    wl-clipboard
    xwayland-satellite

    floorp-bin

    # For Steam
    protonplus
    liberation_ttf

    # Gnome Apps
    papers
    gnome-disk-utility
    baobab
    loupe
    gnome-text-editor
    gnome-themes-extra
    adwaita-icon-theme
    showtime
    amberol
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
