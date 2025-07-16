return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        config = function()
            local dap = require('dap')
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = '/home/caroline/.vscode/extensions/ms-vscode.cpptools-1.23.6-linux-x64/debugAdapters/bin/OpenDebugAD7',
            }
            dap.configurations.cpp = {
                {
                    name = "M33 Launch",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/freertos_m33/artifacts/Debug')
                    end,
                    cwd = '${workspaceFolder}',
                    miDebuggerPath = '/opt/st/stm32cubeclt_1.17.0/GNU-tools-for-STM32/bin/arm-none-eabi-gdb',
                    miDebuggerServerAddress = 'localhost:3333',
                    hardwareBreakpoints = {
                        require = true,
                        limit = 8
                    }
                }
            }
        end
    }
}
