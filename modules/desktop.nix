{ pkgs, ... }: {
  programs = {
    niri.enable = true;
    xwayland.enable = true;
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };
  programs.noctalia-greeter = {
    enable = true;
    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
      keyboard = {
        layout = "us";
      };
    };
  };
}
