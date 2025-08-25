-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-----------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim general keymaps:
-----------------------------------------------------------

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_opts)
map("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Keep visual mode indenting
map("v", "<", "<gv", default_opts)
map("v", ">", ">gv", default_opts)

-- Clear search highlighting
-- map("n", "<leader>fc", ":nohl <CR>", default_opts)

-- Comentado el dia 20/10
-- map("", "<up>", "<up>", { noremap = true })
-- map("", "<down>", "<down>", { noremap = true })
-- map("", "<left>", "<left>", { noremap = true })
-- map("", "<right>", "<right>", { noremap = true })

map("i", "<C-h>", "<left>", default_opts)
map("i", "<C-j>", "<down>", default_opts)
map("i", "<C-k>", "<up>", default_opts)
map("i", "<C-l>", "<right>", default_opts)

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- Back tab
-- Comentado el dia 20/10
map("i", "<S-Tab>", "<C-d>", default_opts)

-- Select with shift + arrows
map("i", "<S-Left>", "<Left><C-o>v", default_opts)
map("i", "<S-Right>", "<C-o>v", default_opts)
map("i", "<S-Up>", "<Left><C-o>v<Up><Right>", default_opts)
map("i", "<S-Down>", "<C-o>v<Down><Left>", default_opts)
map("i", "<C-S-Left>", "<S-Left><C-Left>", {})
map("i", "<C-S-Right>", "<S-Right><C-Right>", {})
map("v", "<S-Left>", "<Left>", default_opts)
map("v", "<S-Right>", "<Right>", default_opts)
map("v", "<S-Up>", "<Up>", default_opts)
map("v", "<S-Down>", "<Down>", default_opts)

--" Auto unselect when not holding shift
map("v", "<Left>", "<Esc>", {})
map("v", "<Right>", "<Esc><Right>", {})
map("v", "<Up>", "<Esc><Up>", {})
map("v", "<Down>", "<Esc><Down>", {})

-- Move text up and down
--  A = shift
map("v", "<A-j>", ":m .+1<CR>==", default_opts)
map("v", "<A-k>", ":m .-2<CR>==", default_opts)
-- map("v", "p", '"_dP', default_opts)
map("x", "J", ":move '>+1<CR>gv-gv", default_opts)
map("x", "K", ":move '<-2<CR>gv-gv", default_opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", default_opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", default_opts)

-- Move between tabs
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", default_opts)
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", default_opts)

-----------------------------------------------------------
-- Desactivar algunos keymaps:
-----------------------------------------------------------
-- Windows

map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
-- map("n", '<leader>w"', "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map(
    "n",
    "<leader><Right>",
    ":vertical resize +5<CR>",
    { desc = "Increase window size to the right" }
)
map("n", "<leader><Left>", ":vertical resize -5<CR>", { desc = "Decrease window size to the left" })
map("n", "<leader><Down>", ":resize +5<CR>", { desc = "Increase window size downward" })
map("n", "<leader><Up>", ":resize -5<CR>", { desc = "Decrease window size upward" })

-- Modo normal: evita sobrescribir el registro cuando borras con `x` o `d`

-- map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "d", '"_d', { noremap = true, silent = true })

-- Modo visual: evita sobrescribir el registro cuando borras con `d`
-- map("v", "x", '"_d', { noremap = true, silent = true })
map("v", "d", '"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ft", function()
    require("fzf-lua").grep({ search = "TODO:" })
end, { desc = "Buscar TODOs en el proyecto" })
