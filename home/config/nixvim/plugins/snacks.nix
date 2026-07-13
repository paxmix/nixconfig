{
  lib,
  config,
  ...
}:
{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        sections = [
          {
            header = ''
              ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
              ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
              ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
              ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
              ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
              ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            '';
          }
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Find Files";
            __unkeyed-1.__raw = "require('snacks').dashboard.sections.recent_files({cwd = true})";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            gap = 1;
            padding = 1;
          }
          {
            pane = 1;
            icon = " ";
            desc = "Browse Repo";
            padding = 1;
            key = "b";
            action.__raw = ''
              function()
                Snacks.gitbrowse()
              end'';
          }
          (lib.mkIf config.plugins.lazy.enable { section = "startup"; })
        ];
      };
      bigfile.enabled = true;
      quickfile.enabled = true;
      words.enabled = true;
      indent = {
        enabled = true;
        scope = {
          enabled = true;
          character = "▎";
        };
      };
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      picker.enabled = true;
      explorer = {
        enabled = true;
        layout = {
          layout = {
            position = "right";
          };
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader><space>";
      action = {
        __raw = "function() Snacks.picker.smart() end";
      };
      options.desc = "Smart Find Files (Snacks)";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = {
        __raw = "function() Snacks.picker.grep() end";
      };
      options.desc = "Grep Project (Snacks)";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = {
        __raw = "function() Snacks.explorer() end";
      };
      options.desc = "Toggle Right Explorer (Snacks)";
    }
    {
      key = "<leader>nn";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = {
        __raw = "function() Snacks.notifier.hide() end";
      };
      options.desc = "Dismiss Notifications";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = {
        __raw = "function() Snacks.picker.buffers() end";
      };
      options.desc = "Find Buffers (Snacks)";
    }
    {
      key = "<leader>ff";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gl";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gB";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gs";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>:";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
    }
    {
      key = "gd";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
    }
    {
      key = "gD";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
    }
    {
      key = "gr";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
    }
    {
      key = "gI";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
    }
    {
      key = "gy";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
    }
    {
      key = "<leader>ss";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
    }
    {
      key = "<leader>sS";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
    }
    # Buffer
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<cr>";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>lua Snacks.bufdelete.other()<cr>";
    }
  ];
}
