return {
    {
        'stevearc/overseer.nvim',
        event = "VimEnter",
        config = function()
            require('overseer').setup({ })
            local overseer = require('overseer')
            overseer.register_template({
                name = "dmake",
                params = {
                    config = {
                        type = "enum",
                        choices = {"freertos", "linux-arm", "linux-aarch64", "qnx", "linux"},
                    },
                    build = {
                        type = "enum",
                        choices = {"Release", "Developer", "Debug"},
                        default = "Developer"
                    },
                    target = {
                        type = "string",
                        default = "all"
                    }
                },
                builder = function(params)
                    return {
                        cmd = { "dmake" },
                        args = { "-c", params.config, "-b", params.build, "-t", params.target },
                        components = {
                            { "on_output_quickfix", open = true, set_diagnostics = true, close = true },
                            "default"
                        },
                    }
                end
            })
            overseer.register_template({
                name = "dbake",
                params = {
                    machine = {
                        type = "enum",
                        choices = {"stm32mp153c-sparta-mx", "stm32mp25-eval-welma", "stm32mp15-disco-welma"},
                        default = "stm32mp153c-sparta-mx"
                    },
                    image = {
                        type = "enum",
                        choices = {"brady-image", "brady-image-dev", "brady-image-dbg", "all"},
                        default = "brady-image-dev"
                    },
                    other = {
                        type = "string",
                        default = ""
                    }
                },
                builder = function(params)
                    local args = {}
                    if params.image ~= "" then
                        args = { "-m", params.machine, params.other }
                    else
                        args = { "-m", params.machine, "-k", params.image }
                    end
                    return {
                        cmd = { "dbake" },
                        args = args,
                        components = {
                            { "on_output_quickfix", open = true, set_diagnostics = true, close = true },
                            "default"
                        },
                    }
                end
            })


        end
    },
}
