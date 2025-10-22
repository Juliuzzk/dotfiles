return {
    -- vim.keymap.set("n", "<leader>p", function()
    --     local val = vim.fn.getreg("+")
    --     vim.api.nvim_command([[normal! p]])
    --     vim.fn.setreg("+", val)
    -- end, {}),

    -- vim.keymap.set("n", "<leader>nrm", ":!rm '%:p'<cr>:bd<cr>"),
    vim.keymap.set("n", "<leader>nrm", function()
        -- Obtener la extensión del archivo actual
        local file_ext = vim.fn.expand("%:e")

        -- Comprobar si la extensión es 'md'
        if file_ext == "md" then
            -- Ejecutar el comando para eliminar el archivo y cerrar el buffer
            local current_buf = vim.fn.bufnr()
            vim.cmd("w")
            vim.cmd("!rm '" .. vim.fn.expand("%:p") .. "'")

            -- Moverse al siguiente buffer disponible
            local next_buf = vim.fn.bufnr("#") -- Obtiene el último buffer usado
            if next_buf > 0 and vim.fn.buflisted(next_buf) == 1 then
                vim.cmd("buffer " .. next_buf) -- Cambia al siguiente buffer
            else
                vim.cmd("bnext") -- Cambia al siguiente buffer en la lista
            end

            -- Cerrar el buffer actual
            vim.cmd("bd " .. current_buf)
            vim.cmd("bd")
        else
            -- Mensaje de advertencia si el archivo no es .md
            print("This command is only for delete markdown files notes.")
        end
    end, { desc = "Delete .md files loaded in buffer" }),

    vim.keymap.set("n", "<leader>co", function()
        -- Obtener la extensión del archivo actual
        local file_ext = vim.fn.expand("%:e")

        -- Comprobar si la extensión es 'md'
        if file_ext == "md" then
            local file = vim.fn.expand("%:p") -- Obtén la ruta completa del archivo
            local escaped_file = file:gsub(" ", "%%20") -- Reemplaza los espacios con %20
            -- Reemplaza el espacio en el nombre del vault con %20
            vim.cmd("!open 'obsidian://open?vault=My Vault&file=" .. file .. "'")
        else
            -- Mensaje de advertencia si el archivo no es .md
            print("This command is only for open markdown files notes in Obsidian.")
        end
    end, { desc = "Open in Obsidian", noremap = true, silent = true }),

    -- vim.keymap.set("n", "<leader>no", function()
    --     -- Obtener la extensión del archivo actual
    --     vim.cmd("!open 'obsidian://open?vault=My Vault'")
    -- end, { desc = "Open in Obsidian", noremap = true, silent = true }),

    vim.keymap.set("n", '<leader>w"', "<C-W>s", { desc = "Split Window Below" }),
    vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" }),
}
