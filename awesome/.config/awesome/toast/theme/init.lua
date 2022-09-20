local beautiful = require("beautiful")
local gears = require("gears")
-- Selected theme
beautiful.init(string.format("%s/.config/awesome/toast/theme/gruvbox/theme.lua", os.getenv("HOME")))

-- client.connect_signal("manage", function(c)
--     c.shape = function(cr, w, h)
--         gears.shape.rounded_rect(cr, w, h, 15)
--     end
-- end)
