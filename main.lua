
snakePart1 = {
    x = 100,
    y = 100,
    size = 100,
}
snakePart2 = {
    x = 100,
    y = 200,
    size = 100,
}

snakeDirection = "up"
snakeMove = 100

snake = {
    snakePart1, snakePart2,
}

apple = {
    x = 100,
    y = 100,
    size = 100,
}

timer = 0
moveInterval = 1 -- 1 segundo

function love.conf(t)
    t.window.vsync = 1
end

function love.update(dt)
    timer = timer + dt

    if timer >= moveInterval then
        timer = 0
        moveSnake(snake)
    end
end

function love.draw()
    drawSnake(snake)
end

function drawSnake(snake)
    love.graphics.setColor(0,1,0)
    for i, part in ipairs(snake) do
        love.graphics.rectangle("fill", part.x , part.y , part.size, part.size)
    end
    drawRandomApple()
    love.graphics.setColor(1,1,1)
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

function moveSnake(snake)
    lastPosition = {
        x = 0,
        y = 0,
    }
    for i, part in ipairs(snake) do
        if i == 1 then
            lastPosition.x = part.x
            lastPosition.y = part.y
            part.x = part.x + snakeMove
        else
            keepLastPosition ={
                x = lastPosition.x,
                y = lastPosition.y
            }
            lastPosition.x = part.x
            lastPosition.y = part.y
            part.x = keepLastPosition.x
            part.y = keepLastPosition.y
        end
    end
end


