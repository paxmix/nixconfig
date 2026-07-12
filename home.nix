{
  config,
  pkgs,
  inputs,
  ...
}:
let
  dotfile = "${config.home.homeDirectory}/nixconfig/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    mango = "mango";
    noctalia = "noctalia";
    bat = "bat";
    btop = "btop";
    ghostty = "ghostty";
    lazygit = "lazygit";
  };
in
{
  imports = [
    inputs.noctalia.homeModules.default
    ./home/git.nix
    ./home/gtk.nix
    ./home/zsh.nix
    ./home/vim.nix
    ./home/yazi.nix
    ./home/helix.nix
  ];

  home.username = "paxmix";
  home.homeDirectory = "/home/paxmix";
  home.stateVersion = "26.05";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfile}/${subpath}";
    recursive = true;
  }) configs;

  programs.noctalia.enable = true;

  home.packages = with pkgs; [
    # CLI
    fastfetch
    tealdeer
    bat
    btop
    lazygit

    # Programming
    gcc
    go

    # Apps
    transmission_4-gtk
    vesktop
    libreoffice-fresh
    localsend
    mission-center
  ];
}
