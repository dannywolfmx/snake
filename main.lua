local snake = require("snake")
local Apple = require("Apple")


local snakeObj
local appleObj

timer = 0
moveInterval = 0.75 -- 0.75 segundos

function love.load()
    -- Seed the random number generator
    math.randomseed(os.time())

    snakeObj = snake.new(100, 100)
    appleObj = Apple.randomizePosition(love.graphics.getWidth(), love.graphics.getHeight())
end

function love.conf(t)
    t.window.vsync = 1
end

function love.update(dt)
    timer = timer + dt

    if timer >= moveInterval then
        timer = 0
        snakeObj = snake.move(snakeObj)
        -- Check if the snake eats the apple
        if snake.checkAppleCollision(snakeObj, appleObj) then
            snake.addTail(snakeObj)
            appleObj = Apple.randomizePosition(love.graphics.getWidth(), love.graphics.getHeight())
        end
    end
end

function love.draw()
    snake.draw(snakeObj)
    Apple.draw(appleObj)
end

-- function to move with the arrows key

function love.keypressed(key)
    if key == "up" and snakeObj.direction ~= "down" then
        snakeObj.direction = "up"
    elseif key == "down" and snakeObj.direction ~= "up" then
        snakeObj.direction = "down"
    elseif key == "left" and snakeObj.direction ~= "right" then
        snakeObj.direction = "left"
    elseif key == "right" and snakeObj.direction ~= "left" then
        snakeObj.direction = "right"
    end
end
