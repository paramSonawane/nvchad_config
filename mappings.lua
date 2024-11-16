require "nvchad.mappings"

local map = vim.keymap.set

map({ "n" }, "<leader>I", "<cmd> Lazy sync <CR>", { desc = "Update plugins" })
map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window Left" })
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window Down" })
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window Up" })
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window Right" })

map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
-- map({ "n" }, "<leader>dr", "<cmd> RustDebuggables <CR>", { desc "Start debugger" })
map({ "n" }, "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start debugger" })
map({ "n" }, "<leader>dn", "<cmd> DapStepOver <CR>", { desc = "Debugger Step Over" })
map({ "n" }, "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "Debugger Stop" })
map({ "n" }, "<leader>dsi", "<cmd> DapStepIn <CR>", { desc = "Debugger Step In" })
map({ "n" }, "<leader>dso", "<cmd> DapStepOut <CR>", { desc = "Debugger Step Out" })
-- map({ "n" }, "<leader>dus", function()
--   local widgets = require "dap.ui.widgets"
--   local sidebar = widgets.sidebar(widgets.scopes)
--   sidebar.open()
-- end, { desc = "Open Debugging Sidebar" })

map({ "n" }, "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Update all crates" })
-- map({ "n" }, "<leader>k", function()
--   local rt = require "rust-tools"
--   rt.hover_actions.hover_actions()
-- end, { desc = "Run/Debug/Info" })
-- map({ "n" }, "<leader>a", function()
--   local rt = require "rust-tools"
--   rt.code_action_group.code_action_group()
-- end, { desc = "Refactor/Actions" })

map({ "n" }, "<leader>gtd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to definition (Lspsaga)" })
map({ "n" }, "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition (Lspsaga)" })
map({ "n" }, "<leader>fci", "<cmd>Lspsaga incoming_calls<cr>", { desc = "Incoming Function Calls" })
map({ "n" }, "<leader>fco", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "Function Calls (Outgoing)" })
map({ "n" }, "<leader>fs", "<cmd>Lspsaga finder<cr>", { desc = "Find Symbol Usage" })
map({ "n" }, "<leader>fsr", "<cmd>Lspsaga finder ref<cr>", { desc = "Find Symbol References" })
map({ "n" }, "<leader>fsi", "<cmd>Lspsaga finder imp<cr>", { desc = "Find Symbol Implementations" })
map({ "n" }, "<leader>wd", "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>", {
  desc = "Show Workspace Problems",
})
map({ "n" }, "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics ++normal<cr>", { desc = "Show Buffer Problems" })
map({ "n" }, "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Diagnostic Prev" })
map({ "n" }, "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Diagnostic Next" })
map({ "n" }, "<leader>k", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover Docs" })
map({ "n" }, "<leader>ra", "<cmd>Lspsaga rename<cr>", { desc = "Rename Symbol" })
map({ "n" }, "<leader>co", "<cmd>Lspsaga outline<cr>", { desc = "Code Outline" })
map({ "n" }, "<leader>a", "<cmd>Lspsaga code_action<cr>", { desc = "Code Actions" })

-- map({ "n" }, "<leader>fs", function()
--   require("telescope").extensions.live_grep_args.live_grep_args()
-- end, { desc = "Live Grep Args" })

map({ "n" }, "<leader>gs", require("mapping_functions").git_stage, { desc = "Git stage" })
map({ "n" }, "<leader>gus", require("mapping_functions").git_unstage, { desc = "Git unstage" })

map({ "n" }, "<leader>md", require("mapping_functions").preview_md, { desc = "Preview Markdown File" })

map({ "n" }, "<leader>fm", require("mapping_functions").format_pretty, { desc = "Conform Formatting" })

map({ "n" }, "<leader>sv", "<cmd>VenvSelect<cr>", { desc = "Select Virtual Environment" })
map({ "n" }, "<leader>sc", "<cmd>VenvSelectCached<cr>", { desc = "Select Previous Virtual Environment" })
