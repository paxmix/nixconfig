{
  config,
  pkgs,
  ...
}:
let
  dotfile = "${config.home.homeDirectory}/nixconfig/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    doom = "doom";
    mango = "mango";
    noctalia = "noctalia";
    tmux = "tmux";
  };
in
{
  imports = [
    ./config/browser.nix
    ./config/catppuccin.nix
    ./config/emacs.nix
    ./config/eza.nix
    ./config/git.nix
    ./config/gtk.nix
    ./config/nix-search-tv.nix
    ./config/qt.nix
    ./config/sesh.nix
    ./config/shell.nix
    ./config/starship.nix
    ./config/term.nix
    ./config/vim.nix
    ./config/xdg.nix
    ./config/yazi.nix
    ./config/zoxide.nix
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
      btop
      tmux
      sqlite
      imagemagick
      ffmpeg-full
      streamlink
      yt-dlp
      go-grip
      ripgrep
      fd
      duf
      dust
      jq

      # Programming
      gcc
      go
      gnumake
      cmake
      odin

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

  programs = {
    bat.enable = true;
  };
}
