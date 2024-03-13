return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        config = function()

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local map = require('core.utils.utils').map
            -- DAP
            map("n", "<leader>dc", "<CMD>lua dap.continue()<CR>")
            map("n", "<leader>dl", "<CMD>lua dap.launch()<CR>")
            map("n", "<leader>n", "<CMD>lua dap.step_over()<CR>")
            map("n", "<leader>si", "<CMD>lua dap.step_into()<CR>")
            map("n", "<leader>so", "<CMD>lua dap.step_out()<CR>")
            map("n", "<leader>tb", "<CMD>lua dap.toggle_breakpoint()<CR>")
            map("n", "<leader>dq", "<CMD>lua dap.disconnect({ terminateDebuggee = true })<CR>")

            function launchqnx()
                -- if vim.fn.filereadable(".vscode/launch.json") then
                --     require("dap.ext.vscode").load_launchjs(nil, { cpptools = { "c", "cpp" }})
                -- end
                require("dap").continue()
            end 

            map("n", "<leader>lq", launchqnx)

            vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
            vim.fn.sign_define("DapStopped", { text = "⚡" })

            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
				command = "$MASON/bin/OpenDebugAD7",
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "gdb",
                    miDebuggerPath = "/home/caroline/qnx710/host/linux/x86_64/usr/bin/ntoarmv7-gdb",
                    miDebuggerArgs = "-x /home/caroline/repos/pretty-print/src/gdbinit",
                    variables = {
                        application = '/home/caroline/repos/aurora-00/build/qnx-vs-debug/artifacts/Debug/Aurora',
                        ip = '10.244.78.153'
                        -- application = function()
                        --     return vim.ui.input({ prompt = 'Path to executable: ', default = vim.fn.getcwd() .. '/build/qnx-vs-debug/artifacts/Debug'})
                        -- end,
                        -- ip = function()
                        --     return vim.ui.input({ prompt = 'IP of Target: ', default = '10.244.78.153'})
                        -- end,
                    },
                    program = '${application}',
                    setupCommands = {
                        {
                            text = "target qnx ${ip}:8000"
                        },
                        {
                            text = "set upload-sets-exec"
                        },
                        {
                            text = "upload ${application} /tmp/DebuggingApplication"
                        },
                        {
                            text = "-enable-pretty-printing"
                        },
                        {
                            text = "handle SIGILL pass noprint nostop"
                        },
                    },
                    logging = {
                        programOutput = true,
                        engineLogging = 'verbose'
                    },
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                }
            }
        end,
        dependencies = {
            {
                "jay-babu/mason-nvim-dap.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                config = true
            },
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    require("dapui").setup()
                end,
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                config = function()
                    require("nvim-dap-virtual-text").setup()
                end,
            },
        },
    },

}

