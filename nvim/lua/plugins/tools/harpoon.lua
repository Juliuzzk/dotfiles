return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        -- Initialize Harpoon
        harpoon:setup()

        -- Main shortcuts
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
            vim.notify("File added to Harpoon")
        end, { desc = "Add file to Harpoon" })

        vim.keymap.set("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Show Harpoon menu" })

        -- Quick navigation
        vim.keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end, { desc = "Go to file 1" })
        vim.keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end, { desc = "Go to file 2" })
        vim.keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end, { desc = "Go to file 3" })
        vim.keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end, { desc = "Go to file 4" })

        -- Navigate between files in the list
        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end, { desc = "Previous file in Harpoon" })
        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end, { desc = "Next file in Harpoon" })
    end,
}
