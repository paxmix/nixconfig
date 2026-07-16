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
      mononoki
      nerd-fonts.mononoki
      nerd-fonts.symbols-only
      inter
      merriweather
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji-blob-bin
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
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
          "Mononoki Nerd Font"
          "Noto Sans Mono"
        ];
        sansSerif = [
          "Inter"
          "Noto Sans"
          "Noto Sans Lao"
        ];
        serif = [
          "Merriweather"
          "Noto Serif"
        ];
        emoji = [
          "Noto Emoji"
          "Noto Color Emoji"
        ];
      };

      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>
          <match target="pattern">
            <test name="family" qual="any">
              <string>Helvetica</string>
            </test>
            <edit name="family" mode="assign" binding="same">
              <string>Inter</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
