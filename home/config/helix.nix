{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt
      statix

      gopls
      gotools
      golangci-lint
      golangci-lint-langserver

      vscode-langservers-extracted

      ols
    ];
  };
}
