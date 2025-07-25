-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define a convenience variable for creating autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Create an autocommand that triggers for all file types
autocmd("Filetype", {
    pattern = { "*" }, -- Apply to all filetypes
    callback = function()
        -- This modifies the 'formatoptions' setting for the current buffer.
        -- The goal is to prevent Neovim from automatically inserting a comment
        -- leader when creating a new line with 'o' or 'O' in Normal mode.
        vim.opt.formatoptions:remove("o")
    end,
    desc = "Disable automatic comment continuation on new lines",
})
