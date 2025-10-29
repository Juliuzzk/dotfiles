return {
    {
        "ibhagwan/fzf-lua",
        optional = true,
        opts = function(_, opts)
            opts.file_ignore_patterns = {
                ".*/node_modules/.*",
                ".*/%.git/.*",
                ".*/build/.*",
                ".*/dist/.*",
                "%.bak$",
                "%.class$",
                "mvnw%.cmd",
                "mvnw$",
                "lazy%-lock%.json",
                ".*/target/.*",
            }
            opts.winopts = {
                preview = {
                    vertical = "up:60%",
                    layout = "vertical",
                },
                -- on_create is a callback that executes when the fzf window is created
                on_create = function()
                    -- called once upon creation of the fzf main window
                    -- can be used to add custom fzf-lua mappings, e.g:
                    vim.keymap.set("t", "<Tab>", "<Down>", { silent = true, buffer = true })
                    vim.keymap.set("t", "<S-Tab>", "<Up>", { silent = true, buffer = true })
                end,
            }
            local actions = require("fzf-lua.actions")
            return vim.tbl_deep_extend("force", opts, {
                files = {
                    cwd_prompt = false,
                    actions = {
                        ["ctrl-i"] = { actions.toggle_ignore },
                        ["ctrl-h"] = { actions.toggle_hidden },
                    },
                },
                grep = {
                    actions = {
                        ["ctrl-i"] = { actions.toggle_ignore },
                        ["ctrl-h"] = { actions.toggle_hidden },
                    },
                },
            })
        end,
    },
}
