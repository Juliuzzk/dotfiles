return {
    {
        "neovim/nvim-lspconfig",
        -- Combinar configuración existente
        opts = function(_, opts)
            opts = opts or {}
            opts.diagnostics = opts.diagnostics or {}
            opts.inlay_hint = opts.inlay_hint or {}

            -- disabled inlay_hint
            opts.inlay_hints = { enabled = false }
            -- Añadir configuración para diagnostics
            opts.diagnostics.float = {
                border = "rounded",
            }
            -- Añadir configuración para keymaps
            opts.keys = {
                { "<c-k>", false, mode = "i" },
                {
                    "<leader>/",
                    function()
                        require("fzf-lua").live_grep()
                    end,
                    desc = "Find Word Grep (fzf-lua)",
                },
                {
                    "<leader>ff",
                    function()
                        require("fzf-lua").files()
                    end,
                    desc = "Find Files (fzf-lua)",
                },
            }

            -- Devuelve las opciones combinadas
            return opts
        end,
    },
}
