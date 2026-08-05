_: 
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages =
      epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
      ];
  };
}
