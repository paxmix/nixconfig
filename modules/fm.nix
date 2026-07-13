{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    gvfs
    sushi
  ];
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
