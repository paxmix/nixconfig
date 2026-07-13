_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "paxmix";
        email = "manh1998nb@gmail.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };
}
