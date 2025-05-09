local Apple = {}
local size = 50

function Apple.new(x, y)
    return {
        x = x,
        y = y,
        size = size,
    }
end

function Apple.draw(apple)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", apple.x, apple.y, apple.size, apple.size, 10, 10)

    -- border
    love.graphics.setColor(0,1,0)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", apple.x , apple.y , apple.size, apple.size, 10, 10)

    --reset the line
    love.graphics.setLineWidth(1)

    love.graphics.setColor(1,1,1)
end

function Apple.randomizePosition(screenWidth, screenHeight)
    local numCols = math.floor(screenWidth / size)
    local numRows = math.floor(screenHeight / size)

    local x = math.random(0, numCols - 1) * size
    local y = math.random(0, numRows - 1) * size


    return Apple.new(x, y)
end



return Apple