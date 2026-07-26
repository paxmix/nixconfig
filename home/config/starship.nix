_: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    settings = fromTOML (builtins.readFile ./starship.toml);
  };
}
