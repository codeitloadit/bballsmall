Ball = require("actors/ball")
Rim = require("actors/rim")
Edge = require("actors/edge")

function love.load()
    g = love.graphics
    g.setBackgroundColor(150, 150, 150)
    keyDown = love.keyboard.isDown

    love.physics.setMeter(200)
    world = love.physics.newWorld(0, 9.81*200, true)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    ball = Ball.create()
    rim = Rim.create()

    edges = {}
    edges.top = Edge.create(0, 0, SW, 0)
    edges.bottom = Edge.create(0, SH, SW, SH)
    edges.left = Edge.create(0, 0, 0, SH)
    edges.right = Edge.create(SW, 0, SW, SH)

end

function love.update(dt)
    world:update(dt)
    ball:update(dt)

    if keyDown(' ') then
        -- ball.body:applyLinearImpulse(-10, -10)
        ball.body:applyForce(-500, -1300)
        ball.body:applyTorque(1200)
    end
end

function love.draw()
    ball:draw()
    rim:draw()
    for _, edge in pairs(edges) do
        edge:draw()
    end
end

function love.keypressed(key)
   if key == "escape" then
      love.event.push("quit")
   end
    if key == "r" then
        love.filesystem.load("main.lua")()
        love.load()
    end
end

function love.mousepressed(x, y, button)
    if button == "l" then
        ball.body:setActive(false)
        ball.body:applyLinearImpulse(0, 0)
        ball.body:applyAngularImpulse(0)
        ball.body:setX(x)
        ball.body:setY(y)
    end
end
function love.mousereleased(x, y, button)
    if button == "l" then
        local bx = ball.body:getX()
        local by = ball.body:getY()

        ball.body:applyLinearImpulse((x-bx)/2, (y-by)/2)
        ball.body:applyAngularImpulse(70)
        ball.body:setActive(true)
    end
end

function beginContact(a, b, coll)
    -- x,y = coll:getNormal()
    -- normal = tostring(x..", "..y)

    -- if x == 0 and y < 0 then ball.angle = 315 end
    -- if x == 0 and y > 0 then ball.angle = 45 end
end

function endContact(a, b, coll)
    
end

function preSolve(a, b, coll)
    
end

function postSolve(a, b, coll)
    
end