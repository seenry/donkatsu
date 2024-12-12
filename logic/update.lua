-- LOVE2D Update Loop
require("shared")

function HandleBackground(dt)
    if (state.increasing == 1) then
        state.background_hue = state.background_hue + 0.1 * dt
    else
        state.background_hue = state.background_hue - 0.1 * dt
    end
    if (state.background_hue <= state.min_hue) then
        state.background_hue = state.min_hue
        state.increasing = 1
    elseif (state.background_hue >= state.max_hue) then
        state.background_hue = state.max_hue
        state.increasing = 0
    end
end

function love.update(dt)
    HandleBackground(dt)
end

function love.resize(w, h)
    state.width = w
    state.height = h
end
