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
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.insertNameservers = [
    "9.9.9.9" # Use Quad9 DNS
    "1.1.1.1"
  ];

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.zsh.enable = true;
  environment.localBinInPath = true;
  environment.sessionVariables = {
    PATH = [
      "$HOME/go/bin"
    ];
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Adwaita";
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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "26.05";
}
