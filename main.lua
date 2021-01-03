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

  for key, zombie in pairs(zombies) do
    local cos = math.cos(
      getPlayerMouseAngle(player.y, zombie.y, player.x, zombie.x)
    )

    local sin = math.sin(
      getPlayerMouseAngle(player.y, zombie.y, player.x, zombie.x)
    )

    zombie.x = zombie.x + (cos * zombie.speed * deltaTime)
    zombie.y = zombie.y + (sin * zombie.speed * deltaTime)
  end
end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)

  love.graphics.draw(
    sprites.player,
    player.x,
    player.y,
    getPlayerMouseAngle(love.mouse.getY(), player.y, love.mouse.getX(), player.x),
    nil,
    nil,
    sprites.player:getWidth() / 2,
    sprites.player:getHeight() / 2
  )

  for key, zombie in ipairs(zombies) do
    love.graphics.draw(
      sprites.zombie,
      zombie.x,
      zombie.y,
      getPlayerMouseAngle(player.y, zombie.y, player.x, zombie.x),
      nil,
      nil,
      sprites.zombie:getWidth() / 2,
      sprites.zombie:getHeight() / 2
    )
  end
end

function love.keypressed(key)
  if key == 'space' then
    spawnZombie()
  end
end
