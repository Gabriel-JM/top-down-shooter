local function spawnZombie()
  local side = math.random(1, 4)
  local sides = {
    {
      x = -30,
      y = math.random(0, love.graphics.getHeight())
    },
    {
      x = love.graphics.getWidth() + 30,
      y = math.random(0, love.graphics.getHeight())
    },
    {
      x = math.random(0, love.graphics.getWidth()),
      y = -30
    },
    {
      x = math.random(0, love.graphics.getWidth()),
      y = love.graphics.getHeight() + 30
    }
  }

  local spawnSide = sides[side]

  local zombie = {
    x = spawnSide.x,
    y = spawnSide.y,
    speed = 120,
    dead = false
  }

  table.insert(zombies, zombie)
end

return spawnZombie
