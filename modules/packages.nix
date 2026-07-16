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
    amberol
    file-roller

    vlc

    bibata-cursors
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
