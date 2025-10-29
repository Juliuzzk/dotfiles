return {
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        event = "InsertEnter",
        opts = {
            panel = { enabled = false }, -- Desactiva el panel de sugerencias flotante
            suggestion = {

                auto_trigger = true, -- Habilita el disparo automático de sugerencias
                hide_during_completion = false, -- Mantiene las sugerencias visibles durante la autocompletación
                keymap = {
                    accept = "<C-.>", -- Aceptar sugerencia
                    accept_word = "<M-w>", -- Aceptar solo la palabra
                    accept_line = "<M-l>", -- Aceptar toda la línea
                    next = "<M-]>", -- Siguiente sugerencia
                    prev = "<M-[>", -- Sugerencia anterior
                    dismiss = "<C-/>", -- Descartar sugerencia
                },
            },
            filetypes = {
                markdown = true, -- Habilitar para archivos Markdown
                yaml = true, -- Habilitar para archivos YAML
            },
        },
    },
}
