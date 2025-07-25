return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>hu", vim.cmd.UndotreeToggle)
            vim.g.undotree_WindowLayout = 3
        end,
    },
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = true,
        opts = {
            window = {
                position = "left",
                width = 30,
            },
        },
    },
    {
        "noice.nvim",
        enabled = true,
        opts = {
            messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = false, -- enables the Noice messages UI
                view = "notify", -- default view for messages
                view_error = "notify", -- view for errors
                view_warn = "notify", -- view for warnings
                view_history = "messages", -- view for :messages
                view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            },
            lsp = {
                diagnostics = {
                    enabled = true, -- controls if the lsp module shows diagnostics
                    -- show on hover
                    hover_with_actions = true,
                },
                progress = {
                    enabled = false,
                },
                hover = {
                    enabled = true,
                    silent = false, -- set to true to not show a message if hover is not available
                },
                signature = {
                    enabled = false,
                },
                message = {
                    -- Messages shown by lsp servers
                    enabled = false,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                lsp_doc_border = true, -- add a border to hover docs and signature help

                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                long_message_to_split = false, -- long messages will be sent to a split
            },
            notify = {
                enabled = false,
                view = "notify",
            },

            popupmenu = {
                enabled = false, -- enables the Noice popupmenu UI
            },
        },
    },

    {
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
    },
}
