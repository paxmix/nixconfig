_: {
  plugins.mini = {
    enable = true;
    modules = {
      ai = {
        n_lines = 100;
        search_method = "cover_or_next";
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
      statusline = {
        use_icons = true;

        content = {
          active = {
            __raw = ''
              function()
                local statusline = require('mini.statusline')
                
                -- Gather standard mini.statusline data pieces
                local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                local git           = statusline.section_git({ trunc_width = 75 })
                local diff          = statusline.section_diff({ trunc_width = 75 })
                local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
                local lsp           = statusline.section_lsp({ trunc_width = 75 })
                local filename      = statusline.section_filename({ trunc_width = 140 })
                local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
                local location      = statusline.section_location({ trunc_width = 120 })

                -- Assemble the blocks using mini's combine_groups utility.
                -- This sets up the look, standard colors, and separator alignment.
                return statusline.combine_groups({
                  { hl = mode_hl,                  strings = { mode } },
                  { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics } },
                  '%<', -- Mark where text should truncate if the window gets too small
                  { hl = 'MiniStatuslineFilename', strings = { filename } },
                  '%=', -- Separation point: aligns everything after this to the right side
                  { hl = 'MiniStatuslineFileinfo', strings = { lsp, fileinfo } },
                  { hl = mode_hl,                  strings = { location } },
                })
              end
            '';
          };
        };
      };

      icons = {
        style = "glyph";
      };
    };
    mockDevIcons = true;
  };
}
