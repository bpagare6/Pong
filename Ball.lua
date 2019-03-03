--[[
    Pong Remake

    -- Ball Class --

    Author: Bhushan Pagare
            bpagare6@gmail.com
    
    Represents a ball which will bounce back and forth between paddles
    and walls until it passes a left or right boundary of the screen,
    scoring a point for the opponent.    
]]

Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- These variables are for keep track of velocity in both the X and Y axis
    -- Since the Ball can move in two dimensions
    self.dx = 0
    self.dy = 0
end

--[[ 
    Expects a Paddle as an argument and returns true or false, depending on
    whether their rectangles overlap
]]
function Ball:collides(paddle)
    -- First check to see if the left edge of either is farther to right
    -- than the right edge of the other
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    -- Then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    -- If above aren't true, then they're overlapping
    return true
end

--[[
    Places the Ball in the middle of the Screen, with an initial random velocity
    on both axes
]]
function Ball:reset()
    self.x = VIRTUAL_WIDTH/2 - 2
    self.y = VIRTUAL_HEIGHT/2 - 2
    self.dx = 0
    self.dy = 0
end

--[[ 
    Simply applies the veloity to position, scaled by deltaTime
]]
function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end