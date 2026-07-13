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
                local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                local git           = statusline.section_git({ trunc_width = 75 })
                local diff          = statusline.section_diff({ trunc_width = 75 })
                local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
                local filename      = statusline.section_filename({ trunc_width = 140 })
                local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
                local location      = statusline.section_location({ trunc_width = 120 })

                local get_lsp_name = function()
                  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                  if #buf_clients == 0 then
                    return ""
                  end
                  return "󰒋 " .. buf_clients[1].name
                end

                local lsp_active_name = get_lsp_name()

                return statusline.combine_groups({
                  { hl = mode_hl,                  strings = { mode } },
                  { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics } },
                  '%<', 
                  { hl = 'MiniStatuslineFilename', strings = { filename } },
                  '%=', 
                  
                  { hl = 'MiniStatuslineFilename', strings = { lsp_active_name } },
                  { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
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
      hipatterns = {
        highlighters = {
          hex_color = {
            __raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
          };
        };
      };
    };
    mockDevIcons = true;
  };
}
