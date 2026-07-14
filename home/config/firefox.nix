{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "en-US"
      "vi"
    ];
    profiles."nixos" = {
      id = 0;
      name = "nixos";
      isDefault = true;
      search = {
        force = true;
        default = "google";
        privateDefault = "ddg";
      };
      settings = {
        "browser.startup.page" = 3;
        "extensions.formautofill.creditCards.enabled" = false;
        "media.ffmpeg.vaapi.enabled" = true;
        "ui.key.menuAccessKeyFocuses" = false;
      };
      extraConfig = builtins.readFile ./betterfox.js;
    };
  };
}
