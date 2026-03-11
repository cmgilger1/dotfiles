return {
    name = "DMAKE",
    builder = function(params)
        return {
            cmd = { 'dmake' },
            args = { "-c", params.configure_preset, "-b", params.build_preset, "-t" , params.build_target },
            name = "Greet",
        }
    end,
    params = {
        configure_preset = {
            type = "enum",
            choices = { "linuxaarch64", "freertos_m33", "linux", "qnx" },
            name = "Configure Preset",
            order = 1,
            optional = false,
            default = "linuxaarch64"
        },
        build_preset = {
            type = "enum",
            choices = { "debug", "developer", "release" },
            name = "Build Preset",
            order = 1,
            optional = false,
            default = "developer"
        },
        build_target = {
            type = "string",
            name = "Build Preset",
            order = 1,
            optional = true,
            default = "all"
        },
    },
}
