{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    gvfs
    sushi
  ];
  programs = {
    nautilus-open-any-terminal.enable = true;
    nautilus-open-any-terminal.terminal = "ghostty";
    dconf.enable = true;
  };
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
