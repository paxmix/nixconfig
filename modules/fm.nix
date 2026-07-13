{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
  ];
  programs.dconf.enable = true;
  services = {
    gnome.sushi.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
