local snake = require("snake")
local Apple = require("Apple")
local Window = require("Window")


local snakeObj
local appleObj
local windowObj
local newDirection

timer = 0
moveInterval = 0.5 -- 0.75 segundos

function love.load()
    -- Seed the random number generator
    math.randomseed(os.time())

    --Set the window properties
    windowObj = Window.new(love.graphics.getWidth(), love.graphics.getHeight())

    --Set the snake properties
    -- windowObj to detect collisions
    snakeObj = snake.new(100, 100, windowObj)
    newDirection = snakeObj.direction
    appleObj = Apple.randomizePosition(love.graphics.getWidth(), love.graphics.getHeight())

end

function love.conf(t)
    t.window.vsync = 1
end

function love.update(dt)
    timer = timer + dt

    if timer >= moveInterval then
        timer = 0
        snakeObj = snake.setDirection(snakeObj, newDirection)
        snakeObj = snake.move(snakeObj)

        -- Check if the snake is collinding with the window
        if Window.isColliding(windowObj, snakeObj) or snake.checkCollisionWithTail(snakeObj) then
            -- End game
            love.window.close()
        end


        -- Check if the snake eats the apple
        if snake.checkCollision(snakeObj, appleObj) then
            snake.addTail(snakeObj)
            appleObj = Apple.randomizePosition(love.graphics.getWidth(), love.graphics.getHeight())
        end
    end
end

function love.draw()
    Window.draw(windowObj)
    snake.draw(snakeObj)
    Apple.draw(appleObj)
end

-- function to move with the arrows key
function love.keypressed(key)
    if key == "up" then
        newDirection = "up"
    elseif key == "down" then
        newDirection = "down"
    elseif key == "left" then
        newDirection = "left"
    elseif key == "right" then
        newDirection = "right"
    end
end
