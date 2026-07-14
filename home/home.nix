{
  config,
  pkgs,
  ...
}:
let
  dotfile = "${config.home.homeDirectory}/nixconfig/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    bat = "bat";
    btop = "btop";
    ghostty = "ghostty";
    lazygit = "lazygit";
    niri = "niri";
    noctalia = "noctalia";
    tmux = "tmux";
  };
in
{
  imports = [
    ./config/eza.nix
    ./config/firefox.nix
    ./config/fzf.nix
    ./config/git.nix
    ./config/gtk.nix
    ./config/sesh.nix
    ./config/vim.nix
    ./config/xdg.nix
    ./config/yazi.nix
    ./config/zoxide.nix
    ./config/zsh.nix
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
      tmux
      sqlite
      imagemagick

      # Programming
      gcc
      go
      gnumake
      cmake

      cargo
      rustc
      rustfmt
      clippy
      rust-analyzer
      lldb

      # Apps
      transmission_4-gtk
      vesktop
      libreoffice-fresh
    ];
  };
}
