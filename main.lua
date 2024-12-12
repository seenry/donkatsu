require("logic/update")
require("logic/draw")

require("shared")

function love.load()
    -- print(os.getenv("HOME"))
    print(love.filesystem.enumerate("C:/Users/Sean/AppData/Local/osu!"))

    state.width = 1024
    state.height = 768
    love.window.setMode(state.width, state.height, {
        resizable=true,
        minwidth=400,
        minheight=300
    })
    love.window.setTitle("donkatsu")

    state.screen = "landing"

    -- Background Graphics Stuff
    state.increasing = 1
    state.min_hue = 0.5
    state.max_hue = 1
    state.background_hue = 0.5

    -- Font
    state.font = love.graphics.newFont("assets/RethinkSans.ttf", 20)
    love.graphics.setFont(state.font)
end
