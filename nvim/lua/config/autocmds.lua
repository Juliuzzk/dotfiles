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

-- autocmd("BufEnter", {
--     group = vim.api.nvim_create_augroup("NoNameClose", { clear = true }),
--     callback = function(args)
--         local buf = args.buf
--         local name = vim.api.nvim_buf_get_name(buf)
--         local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })
--
--         -- Si no tiene nombre, no es especial y está vacío, ciérralo
--         if name == "" and buftype == "" and vim.api.nvim_buf_line_count(buf) == 1 then
--             local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
--             if line == "" then
--                 vim.schedule(function()
--                     vim.api.nvim_buf_delete(buf, { force = true })
--                 end)
--             end
--         end
--     end,
-- })
