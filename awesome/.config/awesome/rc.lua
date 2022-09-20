-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- local hotkeys_popup = require("awful.hotkeys_popup")
-- -- Enable hotkeys help widget for VIM and other apps
-- -- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

require('toast.error')
require('toast.theme.init')
require('toast.apps')
require('toast.autostart')
xrandr = require('toast.xrandr')
require('toast.keymaps')
require('toast.layout')
require('toast.rules')
require('toast.signals')
require('toast.bar.init')



