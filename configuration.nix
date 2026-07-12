{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.mangowm.nixosModules.mango
    inputs.noctalia.nixosModules.default
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Vientiane";
  i18n.defaultLocale = "en_SG.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_SG.UTF-8";
    LC_IDENTIFICATION = "en_SG.UTF-8";
    LC_MEASUREMENT = "en_SG.UTF-8";
    LC_MONETARY = "en_SG.UTF-8";
    LC_NAME = "en_SG.UTF-8";
    LC_NUMERIC = "en_SG.UTF-8";
    LC_PAPER = "en_SG.UTF-8";
    LC_TELEPHONE = "en_SG.UTF-8";
    LC_TIME = "en_SG.UTF-8";
  };
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.mango.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
  services.displayManager = {
    defaultSession = "mango";
    ly.enable = true;
  };

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable ddcutil support globally and create the i2c group
  hardware.i2c.enable = true;
  # Enable the system service for gnome apps
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.dbus.packages = [ pkgs.nautilus ];

  # Enable ZSH
  programs.zsh.enable = true;
  environment.localBinInPath = true;
  environment.sessionVariables = {
    # This appends your custom directory to the system PATH
    PATH = [
      "$HOME/go/bin"
    ];
  };

  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.paxmix = {
    isNormalUser = true;
    description = "Pham Duc Manh";
    shell = pkgs.zsh;
    extraGroups = [
      "i2c"
      "networkmanager"
      "wheel"
    ];
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    git
    ghostty
    curl
    wget
    unzip
    unrar
    p7zip
    ddcutil
    wl-clipboard

    floorp-bin

    # For Steam
    protonplus
    liberation_ttf

    # Gnome Stuffs
    nautilus
    papers
    gnome-disk-utility
    baobab
    loupe
    gnome-text-editor
    adwaita-icon-theme
    showtime
    amberol
  ];

  # XDG Mime
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      "video/mp4" = [ "org.gnome.Showtime.desktop" ];
      "video/mkv" = [ "org.gnome.Showtime.desktop" ];
      "video/webm" = [ "org.gnome.Showtime.desktop" ];
      "audio/mpeg" = [ "io.bassi.Amberol.desktop" ];
      "audio/x-wav" = [ "io.bassi.Amberol.desktop" ];
      "audio/x-flac" = [ "io.bassi.Amberol.desktop" ];
      "audio/mp4" = [ "io.bassi.Amberol.desktop" ];
      "audio/ogg" = [ "io.bassi.Amberol.desktop" ];
      "application/pdf" = [ "org.gnome.Papers.desktop" ];
      "text/html" = [ "floorp.desktop" ];
      "x-scheme-handler/http" = [ "floorp.desktop" ];
      "x-scheme-handler/https" = [ "floorp.desktop" ];
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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Gaming stuffs and NVIDIA
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  programs.gamemode.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "26.05";

}
