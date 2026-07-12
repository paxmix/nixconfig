{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  # Enable the system service for Thunar
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
