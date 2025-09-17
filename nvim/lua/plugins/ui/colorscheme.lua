return {
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
    -- Catppucinn
    -- Primero, configura el plugin de Catppuccin
    {
        "catppuccin/nvim",
        lazy = false, -- Carga el tema al inicio
        name = "catppuccin",
        priority = 1000, -- Asegúrate de que se cargue antes que otros plugins
        opts = {
            flavour = "mocha", -- Elige tu variante preferida
            transparent_background = true, -- ¡La opción clave para la transparencia!
            integrations = {
                -- Aquí mantienes todas tus integraciones
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        },
    },
}
