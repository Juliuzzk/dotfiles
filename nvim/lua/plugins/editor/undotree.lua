return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>hu", vim.cmd.UndotreeToggle)
        vim.g.undotree_WindowLayout = 3
    end,
}