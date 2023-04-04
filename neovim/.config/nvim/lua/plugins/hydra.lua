local function git()
  local gitsigns = require("gitsigns")
  local hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]]
  return {
    name = "Git",
    hint = hint,
    config = {
      buffer = bufnr,
      color = "pink",
      invoke_on_body = true,
      hint = {
        border = "rounded",
      },
      on_enter = function()
        vim.cmd("mkview")
        vim.cmd("silent! %foldopen!")
        vim.bo.modifiable = false
        gitsigns.toggle_signs(true)
        gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd("loadview")
        vim.api.nvim_win_set_cursor(0, cursor_pos)
        vim.cmd("normal zv")
        gitsigns.toggle_signs(false)
        gitsigns.toggle_linehl(false)
        gitsigns.toggle_deleted(false)
      end,
    },
    mode = { "n", "x" },
    body = "<leader>G",
    heads = {
      {
        "J",
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gitsigns.next_hunk()
          end)
          return "<Ignore>"
        end,
        { expr = true, desc = "next hunk" },
      },
      {
        "K",
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gitsigns.prev_hunk()
          end)
          return "<Ignore>"
        end,
        { expr = true, desc = "prev hunk" },
      },
      { "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
      { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
      { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
      { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
      { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
      { "b", gitsigns.blame_line, { desc = "blame" } },
      {
        "B",
        function()
          gitsigns.blame_line({ full = true })
        end,
        { desc = "blame show full" },
      },
      { "/", gitsigns.show, { exit = false, desc = "show base file" } }, -- show the base of the file
      { "<Enter>", "<Cmd>Neogit<CR>", { exit = true, desc = "Neogit" } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    },
  }
end

local function vim_options()
  local hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  ^
       ^^^^                _<Esc>_
]]
  return {
    name = "Options",
    hint = hint,
    config = {
      color = "amaranth",
      invoke_on_body = true,
      hint = {
        border = "rounded",
        position = "middle",
      },
    },
    mode = { "n", "x" },
    body = "<leader>o",
    heads = {
      {
        "n",
        function()
          if vim.o.number == true then
            vim.o.number = false
          else
            vim.o.number = true
          end
        end,
        { desc = "number" },
      },
      {
        "r",
        function()
          if vim.o.relativenumber == true then
            vim.o.relativenumber = false
          else
            vim.o.number = true
            vim.o.relativenumber = true
          end
        end,
        { desc = "relativenumber" },
      },
      {
        "v",
        function()
          if vim.o.virtualedit == "all" then
            vim.o.virtualedit = "block"
          else
            vim.o.virtualedit = "all"
          end
        end,
        { desc = "virtualedit" },
      },
      {
        "i",
        function()
          if vim.o.list == true then
            vim.o.list = false
          else
            vim.o.list = true
          end
        end,
        { desc = "show invisible" },
      },
      {
        "s",
        function()
          if vim.o.spell == true then
            vim.o.spell = false
          else
            vim.o.spell = true
          end
        end,
        { exit = true, desc = "spell" },
      },
      {
        "w",
        function()
          if vim.o.wrap ~= true then
            vim.o.wrap = true
            vim.keymap.set("n", "k", function()
              return vim.v.count > 0 and "k" or "gk"
            end, { expr = true, desc = "k or gk" })
            vim.keymap.set("n", "j", function()
              return vim.v.count > 0 and "j" or "gj"
            end, { expr = true, desc = "j or gj" })
          else
            vim.o.wrap = false
            vim.keymap.del("n", "k")
            vim.keymap.del("n", "j")
          end
        end,
        { desc = "wrap" },
      },
      {
        "c",
        function()
          if vim.o.cursorline == true then
            vim.o.cursorline = false
          else
            vim.o.cursorline = true
          end
        end,
        { desc = "cursor line" },
      },
      { "<Esc>", nil, { exit = true } },
    },
  }
end

local function dap_menu()
  local dap = require("dap")
  local dapui = require("dapui")
  local dap_widgets = require("dap.ui.widgets")

  local hint = [[
 _t_: Toggle Breakpoint             _R_: Run to Cursor
 _s_: Start                         _E_: Evaluate Input
 _c_: Continue                      _C_: Conditional Breakpoint
 _b_: Step Back                     _U_: Toggle UI
 _v_: Variables                     _T_: List breakpoints
 _d_: Disconnect                    _S_: Scopes
 _e_: Evaluate                      _X_: Close
 _f_: Frames                        _P_: Preview
 _g_: Get Session                   _i_: Step Into
 _h_: Hover Variables               _o_: Step Over
 _r_: Toggle REPL                   _u_: Step Out
 _x_: Terminate                     _p_: Pause
 ^ ^               _q_: Quit
]]

  return {
    name = "Debug",
    hint = hint,
    config = {
      color = "pink",
      invoke_on_body = true,
      hint = {
        border = "rounded",
        position = "middle-right",
      },
    },
    mode = "n",
    body = "<leader>d",
    heads = {
      {
        "C",
        function()
          dap.set_breakpoint(vim.fn.input("[Condition] > "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "E",
        function()
          dapui.eval(vim.fn.input("[Expression] > "))
        end,
        desc = "Evaluate Input",
      },
      {
        "R",
        function()
          dap.run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "S",
        function()
          dap_widgets.scopes()
        end,
        desc = "Scopes",
      },
      {
        "U",
        function()
          dapui.toggle()
        end,
        desc = "Toggle UI",
      },
      {
        "X",
        function()
          dap.close()
        end,
        desc = "Quit",
      },
      {
        "b",
        function()
          dap.step_back()
        end,
        desc = "Step Back",
      },
      {
        "c",
        function()
          dap.continue()
        end,
        desc = "Continue",
      },
      {
        "d",
        function()
          dap.disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "e",
        function()
          dapui.eval()
        end,
        mode = { "n", "v" },
        desc = "Evaluate",
      },
      {
        "g",
        function()
          dap.session()
        end,
        desc = "Get Session",
      },
      {
        "h",
        function()
          dap_widgets.hover()
        end,
        desc = "Hover Variables",
      },
      {
        "i",
        function()
          dap.step_into()
        end,
        desc = "Step Into",
      },
      {
        "o",
        function()
          dap.step_over()
        end,
        desc = "Step Over",
      },
      {
        "p",
        function()
          dap.pause.toggle()
        end,
        desc = "Pause",
      },
      {
        "r",
        function()
          dap.repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "s",
        function()
          dap.continue()
        end,
        desc = "Start",
      },
      {
        "t",
        function()
          dap.toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "u",
        function()
          dap.step_out()
        end,
        desc = "Step Out",
      },
      {
        "P",
        function()
          dap_widgets.preview()
        end,
        desc = "Preview",
      },
      {
        "x",
        function()
          dap.terminate()
        end,
        desc = "Terminate",
      },
      { "f", "<cmd>Telescope dap frames<CR>", desc = "Frames" },
      { "v", "<cmd>Telescope dap variables<CR>", desc = "Variables" },
      { "T", "<cmd>Telescope dap list_breakpoints<CR>", desc = "List breakpoints" },
      { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
    },
  }
end
return {
  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function(_, _)
      local hydra = require("hydra")
      hydra(dap_menu())
      hydra(vim_options())
      hydra(git())
    end,
  },
}
