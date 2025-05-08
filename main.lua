local snake = require("snake")

apple = {
    x = 100,
    y = 100,
    size = 100,
}

local snakeObj

timer = 0
moveInterval = 2 -- 4 segundo

function love.load()
    snakeObj = snake.new(100, 100)
end

function love.conf(t)
    t.window.vsync = 1
end

function love.update(dt)
    timer = timer + dt

    if timer >= moveInterval then
        timer = 0
        snakeObj = snake.addTail(snakeObj)
        snakeObj = snake.move(snakeObj)
    end
end

function love.draw()
    snake.draw(snakeObj)
    drawRandomApple()
end

function drawRandomApple()
    love.graphics.setColor(1,0,0)
    apple = {
        x = 200,
        y = 200,
        size = 50,
    }
    love.graphics.rectangle("fill", apple.x , apple.y , apple.size, apple.size)
    love.graphics.setColor(1,1,1)
end
