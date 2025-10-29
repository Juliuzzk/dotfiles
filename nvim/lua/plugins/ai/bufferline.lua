return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                indicator = { style = "underline" },
                -- separator_style = "slant",
                -- show_buffer_icons = false,
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)

            -- Define módulo local
            local function close_empty_unnamed_buffers()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if
                        vim.api.nvim_buf_is_loaded(buf)
                        and vim.bo[buf].buflisted
                        and vim.bo[buf].buftype == ""
                        and vim.api.nvim_buf_get_name(buf) == ""
                    then
                        local line_count = vim.api.nvim_buf_line_count(buf)
                        if line_count <= 1 then
                            local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""
                            if first_line == "" then
                                vim.schedule(function()
                                    vim.api.nvim_buf_delete(buf, { force = true })
                                    -- Quita el notify si no quieres ver mensajes
                                    -- vim.notify(
                                    --     "🧹 Closed empty [No Name] buffer",
                                    --     vim.log.levels.DEBUG
                                    -- )
                                end)
                            end
                        end
                    end
                end
            end

            -- Autocmd para limpiar al abrir un archivo real
            vim.api.nvim_create_autocmd("BufReadPost", {
                group = vim.api.nvim_create_augroup("LazyVimCloseNoName", { clear = true }),
                callback = close_empty_unnamed_buffers,
            })
        end,
    },
}
