{ ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {
        n_lines = 100;
        search_method = "cover_or_next";
      };
      indentscope = {
        symbol = "│";
        options.try_as_border = true;
      };
      pairs = { };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
    };
  };
}
