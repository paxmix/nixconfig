{ pkgs, ... }:
{
  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-vcs-plugin
        thunar-media-tags-plugin
      ];
    };
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
  };
}
