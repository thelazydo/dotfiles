-- hs.hotkey.bind({ "alt", "cmd", "ctrl" }, "W", function()
-- 	hs.alert.show("Hello world")
-- end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
	hs.notify.new({ title = "The Lazy", informativeText = "How are you doing?" }):send()
end)
