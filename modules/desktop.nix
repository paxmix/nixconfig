{ pkgs, ... }: {
  programs = {
    mango.enable = true;
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };
  programs.noctalia-greeter = {
    enable = true;
    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        package = pkgs.adwaita-icon-theme;
      };
      keyboard = {
        layout = "us";
      };
    };
  };
}
