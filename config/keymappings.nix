{self, ...}: {
  keymaps = [
    # Oil bindings
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>e";
    }

    # Undotree
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        desc = "Undotree";
      };
    }

    # Lazygit
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }

    # Commentary bindings
    {
      action = "<cmd>Commentary<CR>";
      key = "<leader>/";
    }

    # Telescope bindings

    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = "<leader>ch";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
    }

    # Notify bindings

    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }

    # Bufferline bindings

    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>ba";
      action = "<cmd>%bd<cr>";
      options = {
        desc = "Delete all buffers";
      };
    }

    # AddBashShebang
    {
      mode = "n";
      key = "<leader>bs";
      action = "<cmd>lua AddBashShebang()<CR>";
      options.desc = "AddBashShebang";
    }

    # ToggleLinesAndDiagnostics
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>lua ToggleLinesAndDiagnostics()<CR>";
      options.desc = "Toggle Lines And Diagnostics";
    }

    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>FloatermNew<cr>";
      options = {
        desc = "Opens the terminal in nvim";
      };
    }

    {
      mode = "n"; 
      key = "<leader>to";
      action = "<cmd>FloatermToggle<cr>";
    }

  ];
  extraConfigLua = ''
function AddBashShebang()
  if vim.bo.filetype == 'sh' or vim.bo.filetype == 'bash' then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { '#!/usr/bin/env bash' })
  end
end

function ToggleLinesAndDiagnostics()
  if vim.g._lines_and_diagnostics_visible == nil then
    vim.g._lines_and_diagnostics_visible = true
  end

  if vim.g._lines_and_diagnostics_visible then
    -- Hide line numbers and diagnostics
    vim.diagnostic.hide()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.notify("Line numbers and diagnostics hidden", "info")
  else
    -- Show line numbers and diagnostics
    vim.diagnostic.show()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.notify("Line numbers and diagnostics shown", "info")
  end

  vim.g._lines_and_diagnostics_visible = not vim.g._lines_and_diagnostics_visible
end


  '';
}
