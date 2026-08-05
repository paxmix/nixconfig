{ pkgs, ... }: {
  programs = {
    mango.enable = true;
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };
  services.displayManager.ly.enable = true;
}
