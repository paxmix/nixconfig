{
  config,
  pkgs,
  ...
}:
let
  dotfile = "${config.home.homeDirectory}/nixconfig/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    noctalia = "noctalia";
    bat = "bat";
    btop = "btop";
    ghostty = "ghostty";
    lazygit = "lazygit";
  };
in
{
  imports = [
    ./config/git.nix
    ./config/gtk.nix
    ./config/zsh.nix
    ./config/vim.nix
    ./config/yazi.nix
    ./config/nixvim
  ];

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfile}/${subpath}";
    recursive = true;
  }) configs;

  home = {
    username = "paxmix";
    homeDirectory = "/home/paxmix";
    stateVersion = "26.05";
    packages = with pkgs; [
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
      mission-center
    ];
  };
}
