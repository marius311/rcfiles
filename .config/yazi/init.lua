-- Show hostname on the status bar
Status:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line({})
	end
	local host = " " .. ya.user_name() .. "@" .. ya.host_name() .. " "
	return ui.Line {
		ui.Span(th.status.sep_left.open):fg("green"):bg("reset"),
		ui.Span(host):fg("black"):bg("green"),
		ui.Span(th.status.sep_left.close):fg("green"):bg("reset"),
	}
end, 500, Status.LEFT)
