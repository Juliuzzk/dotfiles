return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- Adaptador js-debug (Node)
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

            local skip = { "<node_internals>/**", "**/node_modules/**" }
            local resolve_maps = { "**", "!**/node_modules/**" }
            local out_files = {
                "${workspaceFolder}/**/*.js",
                "${workspaceFolder}/**/*.mjs",
                "${workspaceFolder}/**/*.cjs",
                "!**/node_modules/**",
            }

            local cfgs = {
                -- 1) Lanzar archivo TS actual con ts-node (si tu proyecto lo usa)
                {
                    name = "Node: Launch current TS (ts-node)",
                    type = "pwa-node",
                    request = "launch",
                    runtimeExecutable = "node",
                    runtimeArgs = { "-r", "ts-node/register/transpile-only", "${file}" },
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    sourceMaps = true,
                    resolveSourceMapLocations = resolve_maps,
                    skipFiles = skip,
                },
                -- 2) Lanzar app vía npm/yarn/pnpm (script 'dev') con inspector
                {
                    name = "App: npm run dev (inspect-brk)",
                    type = "pwa-node",
                    request = "launch",
                    runtimeExecutable = "npm", -- cambia a "yarn" o "pnpm" si prefieres
                    runtimeArgs = { "run", "dev" },
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    sourceMaps = true,
                    resolveSourceMapLocations = resolve_maps,
                    skipFiles = skip,
                    outFiles = out_files,
                    autoAttachChildProcesses = true,
                    runtimeArgsCwd = "${workspaceFolder}",
                    -- Detén en la primera línea para no perder breakpoints tempranos:
                    -- tip: añade NODE_OPTIONS="--inspect-brk" al script si lo necesitas
                },
                -- 3) Adjuntar a un proceso Node ya corriendo (ideal para Next/Nest/etc.)
                {
                    name = "Attach: Pick Process",
                    type = "pwa-node",
                    request = "attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                    resolveSourceMapLocations = resolve_maps,
                    skipFiles = skip,
                    outFiles = out_files,
                },
            }

            for _, ft in ipairs({ "typescript", "typescriptreact", "javascript", "javascriptreact" }) do
                dap.configurations[ft] = cfgs
            end

            -- Keymaps (opcionales, cortitos)
            -- vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Start/Continue" })
            -- vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
            -- vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
            -- vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
            -- vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle BP" })
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function(_, opts)
            local dapui = require("dapui")
            dapui.setup(opts)
            -- Autoabrir/cerrar (opcional):
            -- local dap = require("dap")
            -- dap.listeners.after.event_initialized["dapui"] = function() dapui.open({}) end
            -- dap.listeners.before.event_terminated["dapui"] = function() dapui.close({}) end
            -- dap.listeners.before.event_exited["dapui"] = function() dapui.close({}) end
        end,
    },
}
