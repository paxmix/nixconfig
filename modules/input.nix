{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-bamboo
      ];
    };
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      defaultFonts = {
        monospace = [
          "DejaVu Sans Mono"
          "Noto Sans Mono"
        ];
        sansSerif = [
          "Noto Sans"
        ];
        serif = [
          "Noto Serif"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
