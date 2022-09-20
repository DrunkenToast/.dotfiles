local awful = require("awful")

-- Autostart
autorunApps =
{
    "picom --experimental-backends &",
    "solaar -w hide",
    "nm-applet",
    "systemd-run --on-calendar=\"*:0/1\" --on-active=0 --user -- feh --bg-scale --randomize ~/Pictures/Wallpapers/",
    "xss-lock -- " .. apps.lock .. " &"
}
for app = 1, #autorunApps do
    awful.util.spawn_with_shell(autorunApps[app])
end
