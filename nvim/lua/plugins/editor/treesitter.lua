return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                if lang == "markdown" then
                    return vim.api.nvim_get_mode().mode == "i" -- Desactiva Treesitter solo en Insert Mode
                end
                return false
            end,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- Desactivar Treesitter en Insert Mode
        vim.api.nvim_create_autocmd("InsertEnter", {
            pattern = "*.md",
            callback = function()
                vim.treesitter.stop()
            end,
        })

        -- Reactivar Treesitter en Normal Mode
        vim.api.nvim_create_autocmd("InsertLeave", {
            pattern = "*.md",
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}