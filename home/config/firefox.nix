{
  programs.firefox = {
    enable = true;
    profiles."nixos" = {
      id = 0;
      name = "nixos";
      isDefault = true;
      languagePacks = [
        "en-GB"
        "en-US"
        "vi"
      ];
      settings = {
        "media.ffmpeg.vaapi.enabled" = true;
        "ui.key.menuAccessKeyFocuses" = false;
      };
      extraConfig = builtins.readFile ./betterfox.js;
    };
  };
}
