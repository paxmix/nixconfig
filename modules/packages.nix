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
    zip

    ddcutil
    wl-clipboard
    wlr-randr

    # For Steam
    protonplus
    liberation_ttf

    # Gnome Apps
    papers
    gnome-disk-utility
    baobab
    gnome-themes-extra

    ristretto
    mousepad
    vlc
    strawberry
    file-roller
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
