_: {
  plugins.rustaceanvim = {
    enable = true;

    settings.rust-analyzer = {
      cargo.allFeatures = true;

      check.command = "clippy";

      procMacro.enable = true;

      inlayHints = {
        closingBraceHints.enable = true;
        parameterHints.enable = true;
        typeHints.enable = true;
      };
    };
  };
}
