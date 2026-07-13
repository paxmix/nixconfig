_: {
  programs = {
    niri.enable = true;
    xwayland.enable = true;
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };
  services.displayManager = {
    defaultSession = "niri";
    ly.enable = true;
  };
}
