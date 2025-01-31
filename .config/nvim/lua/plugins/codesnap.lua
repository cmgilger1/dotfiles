return {
    { 
        "mistricky/codesnap.nvim", 
        build = "make",
        config = function()
            require('codesnap').setup(
            {
                mac_window_bar = false,
                title = "CodeSnap.nvim",
                code_font_family = "Agave Nerd Font",
                show_workspace = true,
                watermark_font_family = "Pacifico",
                watermark = "",
                has_line_number = true,
                bg_padding = 0,
                breadcrumbs_separator = "/",
                bg_color = "#ffffff",
                has_breadcrumbs = true,
            })
        end
    }
}
