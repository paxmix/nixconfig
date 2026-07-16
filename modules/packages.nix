{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    unzip
    unrar
    p7zip
    ddcutil
    wl-clipboard
    xwayland-satellite
    foot

    # For Steam
    protonplus
    liberation_ttf

    evtest

    # Gnome Apps
    papers
    gnome-disk-utility
    baobab
    loupe
    gnome-text-editor
    gnome-themes-extra
    showtime
    amberol
    file-roller

    bibata-cursors
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
