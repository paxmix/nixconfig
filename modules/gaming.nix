{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraPackages = with pkgs; [
        bibata-cursors
      ];
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    gamemode.enable = true;
  };
}
