local paredit = require "nvim-paredit"
local autopairs = require "nvim-autopairs"

paredit.setup({
    -- should plugin use default keybindings? (default = true)
    use_default_keys = true,
    -- sometimes user wants to restrict plugin to certain file types only
    -- defaults to all supported file types including custom lang
    -- extensions (see next section)
    filetypes = { "scheme", "clojure", "fennel"},

    -- This controls where the cursor is placed when performing slurp/barf operations
    --
    -- - "remain" - It will never change the cursor position, keeping it in the same place
    -- - "follow" - It will always place the cursor on the form edge that was moved
    -- - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
    --              unless doing so would result in the cursor no longer being within the original form. In
    --              this case it will place the cursor on the moved edge
    cursor_behaviour = "auto", -- remain, follow, auto

    indent = {
        -- This controls how nvim-paredit handles indentation when performing operations which
        -- should change the indentation of the form (such as when slurping or barfing).
        --
        -- When set to true then it will attempt to fix the indentation of nodes operated on.
        enabled = false,
        -- A function that will be called after a slurp/barf if you want to provide a custom indentation
        -- implementation.
        indentor = require("nvim-paredit.indentation.native").indentor,
    },

    -- list of default keybindings
    keys = {
        ["<localleader>S"] = { paredit.unwrap.unwrap_form_under_cursor, "Splice sexp" },
        [">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
        [">("] = { paredit.api.barf_backwards, "Barf backwards" },

        ["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
        ["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },

        [">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
        ["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },

        [">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
        ["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },

        ["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
        ["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

        ["E"] = {
            paredit.api.move_to_next_element_tail,
            "Jump to next element tail",
            -- by default all keybindings are dot repeatable
            repeatable = false,
            mode = { "n", "x", "o", "v" },
        },
        ["W"] = {
            paredit.api.move_to_next_element_head,
            "Jump to next element head",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
        },

        ["B"] = {
            paredit.api.move_to_prev_element_head,
            "Jump to previous element head",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
        },
        ["gE"] = {
            paredit.api.move_to_prev_element_tail,
            "Jump to previous element tail",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
        },

        ["("] = {
            paredit.api.move_to_parent_form_start,
            "Jump to parent form's head",
            repeatable = false,
            mode = { "n", "x", "v" },
        },
        [")"] = {
            paredit.api.move_to_parent_form_end,
            "Jump to parent form's tail",
            repeatable = false,
            mode = { "n", "x", "v" },
        },

        -- These are text object selection keybindings which can used with
        -- standard `d, y, c`, `v`
        ["af"] = {
            paredit.api.select_around_form,
            "Around form",
            repeatable = false,
            mode = { "o", "v" }
        },
        ["if"] = {
            paredit.api.select_in_form,
            "In form",
            repeatable = false,
            mode = { "o", "v" }
        },
        ["aF"] = {
            paredit.api.select_around_top_level_form,
            "Around top level form",
            repeatable = false,
            mode = { "o", "v" }
        },
        ["iF"] = {
            paredit.api.select_in_top_level_form,
            "In top level form",
            repeatable = false,
            mode = { "o", "v" }
        },
        ["ae"] = {
            paredit.api.select_element,
            "Around element",
            repeatable = false,
            mode = { "o", "v" },
        },
        ["ie"] = {
            paredit.api.select_element,
            "Element",
            repeatable = false,
            mode = { "o", "v" },
        },
        -- Wrap parenthesis
        ["<localleader>w"] = {
            function()
                -- place cursor and set mode to `insert`
                paredit.cursor.place_cursor(
                -- wrap element under cursor with `( ` and `)`
                paredit.wrap.wrap_element_under_cursor("( ", ")"),
                -- cursor placement opts
                { placement = "inner_start", mode = "insert" }
                )
            end,
            "Wrap element insert head",
        },

        ["<localleader>W"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_element_under_cursor("(", ")"),
                { placement = "inner_end", mode = "insert" }
                )
            end,
            "Wrap element insert tail",
        },

        -- same as above but for enclosing form
        ["<localleader>i"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"),
                { placement = "inner_start", mode = "insert" }
                )
            end,
            "Wrap form insert head",
        },

        ["<localleader>I"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"),
                { placement = "inner_end", mode = "insert" }
                )
            end,
            "Wrap form insert tail",
        },

        -- Wrap quotes
        ["<localleader>\"w"] = {
            function()
                -- place cursor and set mode to `insert`
                paredit.cursor.place_cursor(
                -- wrap element under cursor with `( ` and `)`
                paredit.wrap.wrap_element_under_cursor("\" ", "\""),
                -- cursor placement opts
                { placement = "inner_start", mode = "insert" }
                )
            end,
            "Wrap element insert head",
        },

        ["<localleader>\"W"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_element_under_cursor("\"", "\""),
                { placement = "inner_end", mode = "insert" }
                )
            end,
            "Wrap element insert tail",
        },

        -- same as above but for enclosing form
        ["<localleader>\"i"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_element_under_cursor("\" ", "\""),
                { placement = "inner_start", mode = "insert" }
                )
            end,
            "Wrap form insert head",
        },

        ["<localleader>\"I"] = {
            function()
                paredit.cursor.place_cursor(
                paredit.wrap.wrap_element_under_cursor("\"", "\""),
                { placement = "inner_end", mode = "insert" }
                )
            end,
            "Wrap form insert tail",
        }
    }
})

autopairs.setup {
    check_ts = true,
    enable_check_bracket_line = false
}
autopairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp", "clojure",
    "markdown", "text", "tex", "texinfo" }
autopairs.get_rules("`")[1].not_filetypes = { "scheme", "lisp", "clojure" }
