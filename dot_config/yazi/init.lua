-- ~/.config/yazi/init.lua
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b%d %H:%M", time)
	else
		time = os.date("%b%d %Y ", time)
	end

	local size = self._file:size()
	return ui.Line(string.format("%s %s", size and ya.readable_size(size) or "-", time))
end

-- Starship
require("starship"):setup()

-- Yamb
require("yamb"):setup({})

-- Full border
require("full-border"):setup()

-- Git Plugin
require("git"):setup()

-- For status bar
-- Show symlink information in status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil then
		return ""
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = "->" .. tostring(h.link_to)
	end
	return ui.Line("(" .. h.name .. linked .. ")")
end, 500, Status.RIGHT)

-- Show user/group of files in status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil then
		return ""
	end

	return ui.Line({
		"(",
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		")",
	})
end, 500, Status.RIGHT)

-- Show username and hostname in header
Header:children_add(function()
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
