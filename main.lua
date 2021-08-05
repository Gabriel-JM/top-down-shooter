local getPlayerMouseAngle = require('getPlayerMouseAngle')
local spawnZombie = require('spawnZombie')
local distanceBetween = require('distanceBetween')
local spawnBullet = require('spawnBullet')

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
  bullets = {}
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

    if distanceBetween(zombie.x, zombie.y, player.x, player.y) < 30 then
      for i = 1, #zombies do zombies[i] = nil end
    end
  end

  for i, bullet in pairs(bullets) do
    local cos = math.cos(bullet.direction)
    local sin = math.sin(bullet.direction)

    bullet.x = bullet.x + (cos * bullet.speed * deltaTime)
    bullet.y = bullet.y + (sin * bullet.speed * deltaTime)
  end

  for i=#bullets, 1, -1 do
    local currentBullet = bullets[i]

    if (
      currentBullet.x < 0
      or currentBullet.y < 0
      or currentBullet.x > love.graphics.getWidth()
      or currentBullet.y > love.graphics.getHeight()
    ) then
      table.remove(bullets, i)
    end
  end

  for i, zombie in ipairs(zombies) do
    for j, bullet in ipairs(bullets) do
      if distanceBetween(zombie.x, zombie.y, bullet.x, bullet.y) < 20 then
        zombie.dead = true
        bullet.dead = true
      end
    end
  end

  for i=#zombies, 1, -1 do
    local zombie = zombies[i]

    if zombie.dead then
      table.remove(zombies, i)
    end
  end

  for i=#bullets, 1, -1 do
    local bullet = bullets[i]

    if bullet.dead then
      table.remove(bullets, i)
    end
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

  for i, bullet in ipairs(bullets) do
    love.graphics.draw(
      sprites.bullet,
      bullet.x,
      bullet.y,
      nil,
      0.5,
      nil,
      sprites.bullet:getWidth() / 2,
      sprites.bullet:getHeight() / 2
    )
  end
end

function love.keypressed(key)
  if key == 'space' then
    spawnZombie()
  end
end

function love.mousepressed(x, y, button)
  local leftClick = 1
  if button == leftClick then
    spawnBullet()
  end
end
