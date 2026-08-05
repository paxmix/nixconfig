_: {
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    enableFishIntegration = true;
    settings = {
      gtk-tabs-location = "bottom";
      font-family = "JetBrains Mono NL";
      font-size = 12;
      window-padding-x = 5;
      window-padding-y = 5;
      confirm-close-surface = false;
      mouse-hide-while-typing = true;
    };
  };
}
