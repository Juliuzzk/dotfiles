return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
        filesystem = {
            group_empty_dirs = true,
        },
        window = {
            position = "left",
            width = 30,
            -- auto_expand_width = true, -- This enables the dynamic width
        },

        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1,
                with_markers = true,
            },
        },
    },
}
