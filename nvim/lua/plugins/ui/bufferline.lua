return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers",
                indicator = {
                    style = "none", -- sin barra ni subrayado
                },
                separator_style = "thin", -- separadores suaves
                show_buffer_close_icons = false,
                show_close_icon = false,
                always_show_bufferline = true,
                diagnostics = "nvim_lsp",

                -- Respeta Neo-tree
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "  File Explorer",
                        text_align = "left",
                        highlight = "Directory",
                        separator = true, -- sin línea dura de separación
                        padding = 0,
                    },
                },

                max_name_length = 22,
                tab_size = 22,
                color_icons = true,
            },
            highlights = {
                fill = { bg = "#1e1e2e" },
                background = { bg = "#1e1e2e", fg = "#6c7086" },
                buffer_visible = { bg = "#1e1e2e", fg = "#a6adc8" },
                buffer_selected = {
                    bg = "#313244",
                    fg = "#cdd6f4",
                    bold = true,
                },
                separator = { fg = "#1e1e2e", bg = "#1e1e2e" },
                separator_selected = { fg = "#1e1e2e", bg = "#313244" },
                modified = { fg = "#fab387" },
                modified_selected = { fg = "#f9e2af" },
            },
        },
        config = function(_, opts)
            local bufferline = require("bufferline")
            bufferline.setup(opts)

            local function update_offset()
                local neo_tree_win = nil
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    if vim.bo[buf].filetype == "neo-tree" then
                        neo_tree_win = win
                        break
                    end
                end

                if neo_tree_win then
                    local width = vim.api.nvim_win_get_width(neo_tree_win)
                    vim.g.bufferline_offset_left = width
                    vim.g.bufferline_offset_text = "  File Explorer"
                else
                    vim.g.bufferline_offset_left = 0
                    vim.g.bufferline_offset_text = ""
                end
            end

            vim.api.nvim_create_autocmd(
                { "WinScrolled", "WinResized", "BufWinEnter", "BufWipeout" },
                {
                    callback = update_offset,
                }
            )
        end,
    },
}
