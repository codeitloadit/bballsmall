module(..., package.seeall)

function create()
    local this = {}
    this.radius = 4
    this.x = 40
    this.y = SH/2

    -- Back of rim.
    this.body1 = love.physics.newBody(world, this.x, this.y, 'static')
    this.shape1 = love.physics.newCircleShape(this.radius)
    this.fixture1 = love.physics.newFixture(this.body1, this.shape1)
    this.fixture1:setRestitution(-0.9)

    -- Front of rim.
    this.body2 = love.physics.newBody(world, this.x + 70, this.y, 'static')
    this.shape2 = love.physics.newCircleShape(this.radius)
    this.fixture2 = love.physics.newFixture(this.body2, this.shape2)
    this.fixture1:setRestitution(-0.3)

    --Backboard.
    this.body3 = love.physics.newBody(world, this.x-30, this.y-70, 'static')
    this.shape3 = love.physics.newRectangleShape(12, 200)
    this.fixture3 = love.physics.newFixture(this.body3, this.shape3)

    --thing.
    this.body4 = love.physics.newBody(world, this.x-15, this.y, 'static')
    this.shape4 = love.physics.newRectangleShape(30, 12)
    this.fixture4 = love.physics.newFixture(this.body4, this.shape4)

    -- function this:update(dt)
    --     this.x = this.body:getX()
    --     this.y = this.body:getY()
    -- end

    function this:draw()
        g.setColor(50, 50, 50)
        g.circle("fill", this.body1:getX(), this.body1:getY(), this.radius)
        g.circle("fill", this.body2:getX(), this.body2:getY(), this.radius)
        g.polygon("fill", this.body3:getWorldPoints(this.shape3:getPoints()))
        g.polygon("fill", this.body4:getWorldPoints(this.shape4:getPoints()))
    end

    return this
end
