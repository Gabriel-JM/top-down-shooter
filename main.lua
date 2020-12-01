function love.load()
  sprites = {
    background = love.graphics.newImage('assets/background.png'),
    bullet = love.graphics.newImage('assets/bullet.png'),
    player = love.graphics.newImage('assets/player.png'),
    zombie = love.graphics.newImage('assets/zombie.png')
  }
end

function love.update(deltaTime)
  
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
end
