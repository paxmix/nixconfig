_: {
  diagnostic.settings = {
    virtual_text = true;
    underline = true;
    update_in_insert = false;
    severity_sort = true;
  };

  highlight = {
    DiagnosticUnderlineError = {
      undercurl = true;
      underline = false;
    };
    DiagnosticUnderlineWarn = {
      undercurl = true;
      underline = false;
    };
    DiagnosticUnderlineInfo = {
      undercurl = true;
      underline = false;
    };
    DiagnosticUnderlineHint = {
      undercurl = true;
      underline = false;
    };
  };

  plugins = {
    trouble = {
      enable = true;
      settings = {
        auto_close = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Project Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>Trouble qflist toggle<cr>";
      options.desc = "Quickfix List (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble loclist toggle<cr>";
      options.desc = "Location List (Trouble)";
    }
  ];
}
