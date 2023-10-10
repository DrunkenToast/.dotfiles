-- https://github.com/LazyVim/LazyVim/blob/566049aa4a26a86219dd1ad1624f9a1bf18831b6/lua/lazyvim/plugins/extras/dap/core.lua
return {
    "mfussenegger/nvim-dap",

    dependencies = {

        -- fancy UI for the debugger
        "mxsdev/nvim-dap-vscode-js",
        {
            "rcarriga/nvim-dap-ui",
            -- stylua: ignore
            keys = {
                { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
                { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
            },
            opts = {},
            config = function()
                local dap = require("dap")

                require("dap-vscode-js").setup({
                    adapters = { --[[ 'pwa-node',  ]] 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                    debugger_cmd = { "js-debug-adapter" },
                })

                require("dap").adapters["pwa-node"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "js-debug-adapter",
                        args = { "${port}" },
                    }
                }

                for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
                    require("dap").configurations[language] = {
                        -- attach to a node process that has been started with
                        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
                        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
                        {
                            -- use nvim-dap-vscode-js's pwa-node debug adapter
                            type = "pwa-node",
                            -- attach to an already running node process with --inspect flag
                            -- default port: 9222
                            request = "attach",
                            -- allows us to pick the process using a picker
                            processId = function()
                                return require('dap.utils').pick_process({
                                    filter = function(proc) return string.match(proc.name, ".*node.*") end })
                            end,
                            -- name of the debug action you have to select for this config
                            name = "Attach debugger to existing `node --inspect` process",
                            -- for compiled languages like TypeScript or Svelte.js
                            sourceMaps = true,
                            -- resolve source maps in nested locations while ignoring node_modules
                            resolveSourceMapLocations = {
                                "${workspaceFolder}/**",
                                "!**/node_modules/**" },
                            -- path to src in vite based projects (and most other projects as well)
                            cwd = "${workspaceFolder}/src",
                            -- we don't want to debug code inside node_modules, so skip it!
                            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                        },
                        {
                            type = "pwa-chrome",
                            name = "Launch Chrome to debug client",
                            request = "launch",
                            url = "http://localhost:5173",
                            sourceMaps = true,
                            protocol = "inspector",
                            port = 9222,
                            webRoot = "${workspaceFolder}/src",
                            -- skip files from vite's hmr
                            skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
                        },
                        -- only if language is javascript, offer this debug action
                        language == "javascript" and {
                            -- use nvim-dap-vscode-js's pwa-node debug adapter
                            type = "pwa-node",
                            -- launch a new process to attach the debugger to
                            request = "launch",
                            -- name of the debug action you have to select for this config
                            name = "Launch file in new node process",
                            -- launch current file
                            program = "${file}",
                            cwd = "${workspaceFolder}",
                        } or nil,
                    }
                end


                local dapui = require("dapui")
                dapui.setup()

                dap.listeners.after.event_initialized["dapui_config"] = dapui.open
                dap.listeners.before.event_terminated["dapui_config"] = dapui.close
                dap.listeners.before.event_exited["dapui_config"] = dapui.close
            end,
        },

        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },

        -- mason.nvim integration
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = "mason.nvim",
            cmd = { "DapInstall", "DapUninstall" },
            opts = {
                -- Makes a best effort to setup the various debuggers with
                -- reasonable debug configurations
                automatic_installation = true,

                -- You can provide additional configuration to the handlers,
                -- see mason-nvim-dap README for more information
                handlers = {},

                -- You'll need to check that you have the required things installed
                -- online, please don't ask me how to install them :)
                ensure_installed = {
                    -- Update this to ensure that you have the debuggers for the langs you want
                },
            },
        },
    },

    -- stylua: ignore
    keys = {
        {
            "<leader>dB",
            function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
            desc =
            "Breakpoint Condition"
        },
        {
            "<leader>db",
            function() require("dap").toggle_breakpoint() end,
            desc =
            "Toggle Breakpoint"
        },
        {
            "<leader>dc",
            function() require("dap").continue() end,
            desc =
            "Continue"
        },
        {
            "<leader>dC",
            function() require("dap").run_to_cursor() end,
            desc =
            "Run to Cursor"
        },
        {
            "<leader>dg",
            function() require("dap").goto_() end,
            desc =
            "Go to line (no execute)"
        },
        {
            "<leader>di",
            function() require("dap").step_into() end,
            desc =
            "Step Into"
        },
        {
            "<leader>dj",
            function() require("dap").down() end,
            desc =
            "Down"
        },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        {
            "<leader>dl",
            function() require("dap").run_last() end,
            desc =
            "Run Last"
        },
        {
            "<leader>do",
            function() require("dap").step_out() end,
            desc =
            "Step Out"
        },
        {
            "<leader>dO",
            function() require("dap").step_over() end,
            desc =
            "Step Over"
        },
        {
            "<leader>dp",
            function() require("dap").pause() end,
            desc =
            "Pause"
        },
        {
            "<leader>dr",
            function() require("dap").repl.toggle() end,
            desc =
            "Toggle REPL"
        },
        {
            "<leader>ds",
            function() require("dap").session() end,
            desc =
            "Session"
        },
        {
            "<leader>dt",
            function() require("dap").terminate() end,
            desc =
            "Terminate"
        },
        {
            "<leader>dw",
            function() require("dap.ui.widgets").hover() end,
            desc =
            "Widgets"
        },
    },

    config = function()
        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
        local icons = {
            Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint = " ",
            BreakpointCondition = " ",
            BreakpointRejected = { " ", "DiagnosticError" },
            LogPoint = ".>",
        }
        for name, sign in pairs(icons) do
            sign = type(sign) == "table" and sign or { sign }
            vim.fn.sign_define(
                "Dap" .. name,
                { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
            )
        end
    end,
}
