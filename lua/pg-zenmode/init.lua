local true_zen = require("true-zen")

true_zen.setup(
    {
        true_false_commands = false,
        cursor_by_mode = false,
        before_minimalist_mode_shown = true,
        before_minimalist_mode_hidden = true,
        after_minimalist_mode_shown = true,
        after_minimalist_mode_hidden = true,
        bottom = {
            hidden_laststatus = 0,
            hidden_ruler = false,
            hidden_showmode = false,
            hidden_showcmd = false,
            hidden_cmdheight = 1,
            shown_laststatus = 2,
            shown_ruler = true,
            shown_showmode = false,
            shown_showcmd = false,
            shown_cmdheight = 1
        },
        top = {
            hidden_showtabline = 0,
            shown_showtabline = 2
        },
        left = {
            hidden_number = false,
            hidden_relativenumber = false,
            hidden_signcolumn = "no",
            shown_number = true,
            shown_relativenumber = false,
            shown_signcolumn = "yes"
        },
        ataraxis = {
            just_do_it_for_me = false,
            left_padding = 37,
            right_padding = 37,
            top_padding = 2,
            bottom_padding = 2,
            custome_bg = "#1e222a"
        },
        integrations = {
            integration_galaxyline = true
        }
    }
)

-- Minimalist mode events
true_zen.after_minimalist_mode_hidden = function ()
  print("I ran after minimalist mode hid everything")
end

true_zen.before_minimalist_mode_hidden = function ()
  print("I ran before minimalist mode hid everything")
end

true_zen.after_minimalist_mode_shown = function ()
  print("I ran after minimalist mode showed everything")
end

true_zen.before_minimalist_mode_shown = function ()
  print("I ran before minimalist mode showed everything")
end

-- Focus mode events
true_zen.before_focus_mode_focuses = function ()
  print("I ran before focus mode focused everything")
end

true_zen.before_focus_mode_unfocuses = function ()
  print("I ran before focus mode unfocused everything")
end

true_zen.after_focus_mode_focuses = function ()
  print("I ran after focus mode focused everything")
end

true_zen.after_focus_mode_unfocuses = function ()
  print("I ran before focus mode unfocused everything")
end
