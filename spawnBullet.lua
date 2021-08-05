local getPlayerMouseAngle = require('getPlayerMouseAngle')

local function spawnBullet()
  local bullet = {
    x = player.x,
    y = player.y,
    speed = 500,
    dead = false,
    direction = getPlayerMouseAngle(love.mouse.getY(), player.y, love.mouse.getX(), player.x)
  }

  table.insert(bullets, bullet)
end

return spawnBullet