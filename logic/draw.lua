-- LOVE2D Drawing Loop

-- https://love2d.org/wiki/HSL_color
function HSL(h, s, l, a)
	if s<=0 then return l,l,l,a end
	h, s, l = h*6, s, l
	local c = (1-math.abs(2*l-1))*s
	local x = (1-math.abs(h%2-1))*c
	local m,r,g,b = (l-.5*c), 0,0,0
	if h < 1     then r,g,b = c,x,0
	elseif h < 2 then r,g,b = x,c,0
	elseif h < 3 then r,g,b = 0,c,x
	elseif h < 4 then r,g,b = 0,x,c
	elseif h < 5 then r,g,b = x,0,c
	else              r,g,b = c,0,x
	end return r+m, g+m, b+m, a
end

function DrawLandingScreen()
    local w_ = state.width
    local h_ = state.height
    local fdm_ = game_conf.file_drop_margin
    local r_ = game_conf.file_drop_radius

    love.graphics.setBackgroundColor(HSL(state.background_hue, 0.2, 0.12, 1))

    -- File Drop Box
    love.graphics.line(fdm_ + r_, fdm_, w_ - fdm_ - r_, fdm_) -- top
    love.graphics.line(w_ - fdm_, fdm_ + r_, w_ - fdm_, h_ - fdm_ - r_) -- right
    love.graphics.line(fdm_ + r_, h_ - fdm_, w_ - fdm_ - r_, h_ - fdm_) -- bottom
    love.graphics.line(fdm_, fdm_ + r_, fdm_, h_ - fdm_ - r_) -- left

    local fw_ = state.font:getWidth("drop a .osu map file to get started")
    local fh_ = state.font:getHeight()
    love.graphics.printf("drop a .osu map file to get started", 0, h_ / 2 - 8, w_, "center")
end

function love.draw()
    if (state.screen == "landing") then
        DrawLandingScreen()
    end
end
