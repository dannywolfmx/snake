local Window = {}
local cellSize = 50


function Window.new(width, height)
	return {
		x = 0,
		y = 0,
		width = width,
		height = height,
	}
end

function Window.draw(windowObj)
	Window.border(windowObj)
	Window.grid(windowObj, cellSize)
end

-- Border
-- Width & Height need be the same as the windows
function Window.border(windowObj)
	-- Color border
    love.graphics.setColor(0,0,1)

	--Size border
	love.graphics.setLineWidth(2)

	--Border
	love.graphics.rectangle("line", windowObj.x , windowObj.y, windowObj.width, windowObj.height)

	--Resets
	--Reset color
    love.graphics.setColor(0,0,0)

	--Reset line
	love.graphics.setLineWidth(1)
end

function Window.grid(windowObj, cellSize)
	-- Color border
    love.graphics.setColor(0,0,0.2)

	--Size border
	love.graphics.setLineWidth(2)

	for x = 0, windowObj.width, cellSize do
		for y = 0, windowObj.height, cellSize do
			--cell
			love.graphics.rectangle("line", x , y, windowObj.width, windowObj.height)
		end
	end

	--Resets
	--Reset color
    love.graphics.setColor(0,0,0)

	--Reset line
	love.graphics.setLineWidth(1)
end

function Window.isColliding(windowObj, snakeObj)
    return snakeObj.head.x < windowObj.x or snakeObj.head.y < windowObj.y or
     snakeObj.head.x + 50 > windowObj.width or snakeObj.head.y + 50 > windowObj.height
end

return Window
