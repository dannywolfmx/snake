local snake = {}

local size = 50

function snake.new(x, y)
    return {
        head = {
            x = x,
            y = y,
        },
        tail = {}, -- tail is a list of heads like objects
        direction = "up",
        moveSize = size,
    }
end

function snake.draw(snakeObj)
    -- color green
    love.graphics.setColor(0,0.5,0)

    -- draw the head
    love.graphics.rectangle("fill", snakeObj.head.x , snakeObj.head.y , size, size, 10, 10)

    -- border
    love.graphics.setColor(0,1,0)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", snakeObj.head.x , snakeObj.head.y , size, size, 10, 10)

    --reset the line
    love.graphics.setLineWidth(1)


    -- draw the tail
    for i, part in ipairs(snakeObj.tail) do
        -- color green
        love.graphics.setColor(0,0.2,0)

        love.graphics.rectangle("fill", part.x , part.y , size, size, 10, 10)

        love.graphics.setColor(0,1,0)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("line", part.x , part.y , size, size, 10, 10)

        --reset the line
        love.graphics.setLineWidth(1)
    end

    love.graphics.setColor(1,1,1)
end

-- check if the snake eats the apple
function snake.checkAppleCollision(snakeObj, apple)
    return snakeObj.head.x == apple.x and snakeObj.head.y == apple.y
end

function snake.move(snakeObj)
    lastPosition = {
        x = snakeObj.head.x,
        y = snakeObj.head.y,
    }

    -- Check the direction
    if snakeObj.direction == "up" then
        snakeObj.head.y = snakeObj.head.y - size
    elseif snakeObj.direction == "down" then
        snakeObj.head.y = snakeObj.head.y + size
    elseif snakeObj.direction == "left" then
        snakeObj.head.x = snakeObj.head.x - size
    elseif snakeObj.direction == "right" then
        snakeObj.head.x = snakeObj.head.x + size
    end

    for i, part in ipairs(snakeObj.tail) do
        keepLastPosition ={
            x = lastPosition.x,
            y = lastPosition.y,
        }
        lastPosition.x = part.x
        lastPosition.y = part.y
        part.x = keepLastPosition.x
        part.y = keepLastPosition.y
    end


    return snakeObj
end

function snake.addTail(snakeObj)
    tail = nil
    if #snakeObj.tail == 0 then
        tail = {
            x = snakeObj.head.x,
            y = snakeObj.head.y,
        }
    else
        tail = snakeObj.tail[#snakeObj.tail]
    end

    snakeObj.tail[#snakeObj.tail + 1 ] = {
        x = tail.x,
        y = tail.y
    }
    return snakeObj
end




return snake
