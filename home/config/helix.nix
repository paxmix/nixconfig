{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt

      gopls
      delve
      golangci-lint
      golangci-lint-langserver
      gotools
      vscode-langservers-extracted

      clang-tools
    ];
  };
}
