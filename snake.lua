local snake = {}

local size = 100

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
    love.graphics.setColor(0,1,0)

    -- draw the head
    love.graphics.rectangle("fill", snakeObj.head.x , snakeObj.head.y , size, size)

    -- draw the tail
    for i, part in ipairs(snakeObj.tail) do
        love.graphics.rectangle("fill", part.x , part.y , size, size)
    end

    love.graphics.setColor(1,1,1)
end

function snake.move(snakeObj)
    lastPosition = {
        x = snakeObj.head.x,
        y = snakeObj.head.y,
    }

    snakeObj.head.x = snakeObj.head.x + size

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
