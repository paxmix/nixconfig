{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.noctalia.nixosModules.default
    ./hardware-configuration.nix
    ./modules/gaming.nix
    ./modules/nvidia.nix
    ./modules/packages.nix
    ./modules/input.nix
    ./modules/xdg.nix
    ./modules/desktop.nix
    ./modules/thunar.nix
    ./modules/nix-options.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.insertNameservers = [
      "9.9.9.9" # Use Quad9 DNS
      "1.1.1.1"
    ];
  };

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

  services = {
    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  security.rtkit.enable = true;

  programs.zsh.enable = true;
  environment.localBinInPath = true;
  environment.sessionVariables = {
    PATH = [
      "$HOME/go/bin"
    ];
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  hardware.i2c.enable = true; # For ddcutil
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "26.05";
}
