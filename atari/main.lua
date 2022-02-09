push = require 'push'
Class = require 'class'
require 'Paddle'
require 'Ball'
require 'Brick'

WINDOW_WIDTH = 960
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 720
VIRTUAL_HEIGHT = 540

gameState = 'play'

PADDLE_SPEED = 500

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Atari Breakout!')

    math.randomseed(os.time())

    titleFont = love.graphics.newFont('Neuterous.otf',48)
    infoFont = love.graphics.newFont('Neuterous.otf', 16)
    winFont = love.graphics.newFont('Neuterous.otf', 100)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    player = Paddle(VIRTUAL_WIDTH - 206, VIRTUAL_HEIGHT - 30, 100, 20)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 12, 12)

    brick1 = Brick(0,10)
    brick2 = Brick(60,10)
    brick3 = Brick(120,10)
    brick4 = Brick(180,10)
    brick5 = Brick(240,10)
    brick6 = Brick(300,10)
    brick7 = Brick(360,10)
    brick8 = Brick(420,10)
    brick9 = Brick(480,10)
    brick10 = Brick(540,10)
    brick11 = Brick(600,10)
    brick12 = Brick(660,10)

    brick101 = Brick(0,35)
    brick102 = Brick(60,35)
    brick103 = Brick(120,35)
    brick104 = Brick(180,35)
    brick105 = Brick(240,35)
    brick106 = Brick(300,35)
    brick107 = Brick(360,35)
    brick108 = Brick(420,35)
    brick109 = Brick(480,35)
    brick1010 = Brick(540,35)
    brick1011 = Brick(600,35)
    brick1012 = Brick(660,35)

    brick111 = Brick(0,60)
    brick112 = Brick(60,60)
    brick113 = Brick(120,60)
    brick114 = Brick(180,60)
    brick115 = Brick(240,60)
    brick116 = Brick(300,60)
    brick117 = Brick(360,60)
    brick118 = Brick(420,60)
    brick119 = Brick(480,60)
    brick1110 = Brick(540,60)
    brick1111 = Brick(600,60)
    brick1112 = Brick(660,60)

    brick121 = Brick(0,85)
    brick122 = Brick(60,85)
    brick123 = Brick(120,85)
    brick124 = Brick(180,85)
    brick125 = Brick(240,85)
    brick126 = Brick(300,85)
    brick127 = Brick(360,85)
    brick128 = Brick(420,85)
    brick129 = Brick(480,85)
    brick1210 = Brick(540,85)
    brick1211 = Brick(600,85)
    brick1212 = Brick(660,85)

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
        gameState = 'win'
    end
    if ball:collides(player) then
        --ball.dx = -ball.dx
        ball.dy = -ball.dy
    end

    if ball.y >= VIRTUAL_HEIGHT - 10 then
        ball:reset()
        
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
    if gameState == 'play' then
    
        love.graphics.printf("Atari!", 0, VIRTUAL_HEIGHT/2 + 100, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(infoFont)
        love.graphics.printf("Break into the next world by getting to the top of the screen!", 0, VIRTUAL_HEIGHT/2 + 160, VIRTUAL_WIDTH, 'center')

        player:render()
        ball:render()
        if brick1:alive() == 'true' then
            brick1:render(ball)
        end
        if brick2:alive() == 'true' then
            brick2:render(ball)
        end
        if brick3:alive() == 'true' then
            brick3:render(ball)
        end
        if brick4:alive() == 'true' then
            brick4:render(ball)
        end
        if brick5:alive() == 'true' then
            brick5:render(ball)
        end
        if brick6:alive() == 'true' then
            brick6:render(ball)
        end
        if brick7:alive() == 'true' then
            brick7:render(ball)
        end
        if brick8:alive() == 'true' then
            brick8:render(ball)
        end
        if brick9:alive() == 'true' then
            brick9:render(ball)
        end
        if brick10:alive() == 'true' then
            brick10:render(ball)
        end
        if brick11:alive() == 'true' then
            brick11:render(ball)
        end
        if brick12:alive() == 'true' then
            brick12:render(ball)
        end
        
        if brick101:alive() == 'true' then
            brick101:render(ball)
        end
        if brick102:alive() == 'true' then
            brick102:render(ball)
        end
        if brick103:alive() == 'true' then
            brick103:render(ball)
        end
        if brick104:alive() == 'true' then
            brick104:render(ball)
        end
        if brick105:alive() == 'true' then
            brick105:render(ball)
        end
        if brick106:alive() == 'true' then
            brick106:render(ball)
        end
        if brick107:alive() == 'true' then
            brick107:render(ball)
        end
        if brick108:alive() == 'true' then
            brick108:render(ball)
        end
        if brick109:alive() == 'true' then
            brick109:render(ball)
        end
        if brick1010:alive() == 'true' then
            brick1010:render(ball)
        end
        if brick1011:alive() == 'true' then
            brick1011:render(ball)
        end
        if brick1012:alive() == 'true' then
            brick1012:render(ball)
        end

        if brick111:alive() == 'true' then
            brick111:render(ball)
        end
        if brick112:alive() == 'true' then
            brick112:render(ball)
        end
        if brick113:alive() == 'true' then
            brick113:render(ball)
        end
        if brick114:alive() == 'true' then
            brick114:render(ball)
        end
        if brick115:alive() == 'true' then
            brick115:render(ball)
        end
        if brick116:alive() == 'true' then
            brick116:render(ball)
        end
        if brick117:alive() == 'true' then
            brick117:render(ball)
        end
        if brick118:alive() == 'true' then
            brick118:render(ball)
        end
        if brick119:alive() == 'true' then
            brick119:render(ball)
        end
        if brick1110:alive() == 'true' then
            brick1110:render(ball)
        end
        if brick1111:alive() == 'true' then
            brick1111:render(ball)
        end
        if brick1112:alive() == 'true' then
            brick1112:render(ball)
        end

        if brick121:alive() == 'true' then
            brick121:render(ball)
        end
        if brick122:alive() == 'true' then
            brick122:render(ball)
        end
        if brick123:alive() == 'true' then
            brick123:render(ball)
        end
        if brick124:alive() == 'true' then
            brick124:render(ball)
        end
        if brick125:alive() == 'true' then
            brick125:render(ball)
        end
        if brick126:alive() == 'true' then
            brick126:render(ball)
        end
        if brick127:alive() == 'true' then
            brick127:render(ball)
        end
        if brick128:alive() == 'true' then
            brick128:render(ball)
        end
        if brick129:alive() == 'true' then
            brick129:render(ball)
        end
        if brick1210:alive() == 'true' then
            brick1210:render(ball)
        end
        if brick1211:alive() == 'true' then
            brick1211:render(ball)
        end
        if brick1212:alive() == 'true' then
            brick1212:render(ball)
        end

        
    elseif gameState == 'win' then
        love.graphics.setFont(winFont)
        love.graphics.printf("YOU WIN!", 0, VIRTUAL_HEIGHT/2 - 60, VIRTUAL_WIDTH, 'center')
    end


    
    push: apply('end')
end