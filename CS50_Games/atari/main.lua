push = require 'push'
Class = require 'class'
require 'Paddle'
require 'Ball'

WINDOW_WIDTH = 960
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 720
VIRTUAL_HEIGHT = 540

PADDLE_SPEED = 200

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Atari Breakout!')

    math.randomseed(os.time())

    titleFont = love.graphics.newFont('Neuterous.otf',48)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    player = Paddle(VIRTUAL_WIDTH - 206, VIRTUAL_HEIGHT - 30, 50, 10)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 12, 12)

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.resize(w,h)
    push:resize(w,h) 
end

function love.update(dt)
    --Ball Stuff
    if ball.x <= 0 then
        ball.dx = 100
    end
    
    if ball.x >= VIRTUAL_WIDTH - 4 then
        ball.dx = -100
    end

    if ball.y <= 0 then
        ball.dy = -ball.dy
        ball.y=0
        
    end

    if ball.y >= VIRTUAL_HEIGHT - 4 then
        ball.dy = -ball.dy
        ball.y = VIRTUAL_HEIGHT - 4
        
    end
    --Paddle Keys
    if love.keyboard.isDown('a') then
        player.dx = -PADDLE_SPEED
    elseif love.keyboard.isDown('d') then
        player.dx = PADDLE_SPEED
    else
        player.dx = 0
    end
    --Class updates
    player:update(dt)
    ball:update(dt)
end

function love.draw()
    push: apply('start')
    love.graphics.setFont(titleFont)
    love.graphics.printf("Atari!", 0, VIRTUAL_HEIGHT/2 + 100, VIRTUAL_WIDTH, 'center')

    player:render()

    ball:render()
    push: apply('end')
end