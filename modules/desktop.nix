{ ... }:
{
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
  services.displayManager = {
    defaultSession = "niri";
    ly.enable = true;
  };
}
