Brick = Class{}

function Brick:init(x, y)
    self.x = x
    self.y = y
    self.width = 60
    self.height = 25
    self.destroyed = false
    self.r = 1
    self.g = 1
    self.b = 1
    self.tester = false

end

function Brick:update(dt)

end

function Brick:alive()
    if not self.destroyed then
        return 'true'
    elseif self. destroyed then
        return 'false'
    end
end


function Brick:render(box)
    if self.x > box.x + box.width or self.x + self.width < box.x or self.y > box.y + box.height or self.y + self.height < box.y then
        self.tester = true
    else
        self.tester = false
    end

    if self.tester == false then
        self.destroyed = true
        box.dx = -box.dx
        box.dy = -box.dy
    end

    

    if not self.destroyed then
        love.graphics.setColor(self.r, self.g, self.b)
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end
end