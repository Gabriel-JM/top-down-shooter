local getPlayerMouseAngle = require('getPlayerMouseAngle')
local spawnZombie = require('spawnZombie')

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

  zombies = {}


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

  love.graphics.draw(
    sprites.player,
    player.x,
    player.y,
    getPlayerMouseAngle(player.y, love.mouse.getY(), player.x, love.mouse.getX()),
    nil,
    nil,
    sprites.player:getWidth() / 2,
    sprites.player:getHeight() / 2
  )

  for index, zombie in ipairs(zombies) do
    love.graphics.draw(
      sprites.zombie,
      zombie.x,
      zombie.y
    )
  end
end

function love.keypressed(key)
  if key == 'space' then
    spawnZombie()
  end
end
