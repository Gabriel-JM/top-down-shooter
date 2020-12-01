function love.load()
  sprites = {
    background = love.graphics.newImage('assets/background.png'),
    bullet = love.graphics.newImage('assets/bullet.png'),
    player = love.graphics.newImage('assets/player.png'),
    zombie = love.graphics.newImage('assets/zombie.png')
  }

  player = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2,
    speed = 180
  }
end

function love.update(deltaTime)
  if love.keyboard.isDown('d') then
    player.x = player.x + player.speed * deltaTime
  end

  if love.keyboard.isDown('a') then
    player.x = player.x - player.speed * deltaTime
  end

  if love.keyboard.isDown('w') then
    player.y = player.y - player.speed * deltaTime
  end

  if love.keyboard.isDown('s') then
    player.y = player.y + player.speed * deltaTime
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)

  love.graphics.draw(sprites.player, player.x, player.y)
end
