return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            -- 1. Configuración del adaptador para TypeScript/Next.js (usa js-debug-adapter)

            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = {
                        require("mason-registry")
                            .get_package("js-debug-adapter")
                            :get_install_path()
                            .. "/js-debug/src/dapDebugServer.js",
                        "${port}",
                    },
                },
            }

            -- 2. Configuración específica para Next.js
            dap.configurations.typescript = {
                {
                    name = "Launch Next.js Dev Server",
                    type = "pwa-node",
                    request = "launch",
                    runtimeExecutable = "npm", -- o "yarn"
                    runtimeArgs = { "run", "dev" },
                    cwd = "${workspaceFolder}",
                    skipFiles = { "<node_internals>/**" },
                    sourceMaps = true,
                    protocol = "inspector",
                    console = "integratedTerminal",
                    port = 3000,
                },
            }

            -- 3. Keymaps (¡agrégalos aquí si no los tienes en otro archivo!)
            -- vim.keymap.set("n", "<F5>", function()
            --     dap.continue()
            -- end, { desc = "Debug: Start/Continue" })
            -- vim.keymap.set("n", "<F10>", function()
            --     dap.step_over()
            -- end, { desc = "Debug: Step Over" })
            -- vim.keymap.set("n", "<F11>", function()
            --     dap.step_into()
            -- end, { desc = "Debug: Step Into" })
            -- vim.keymap.set("n", "<F12>", function()
            --     dap.step_out()
            -- end, { desc = "Debug: Step Out" })
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
            --     dapui.open({})
            -- end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --     dapui.close({})
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --     dapui.close({})
            -- end
        end,
    },
}
