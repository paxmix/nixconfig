{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages =
      epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
      ];
  };

  home.packages = with pkgs; [
    symbola

    gopls
    gotools
    gomodifytags
    gotests
    gore

    nixd
    nixfmt

    ols

    pandoc

    shfmt
    shellcheck

    html-tidy
    stylelint
    js-beautify
  ];
}
