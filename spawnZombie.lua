local function spawnZombie()
  local zombie = {
    x = math.random(0, love.graphics.getWidth()),
    y = math.random(0, love.graphics.getHeight()),
    speed = 120
  }

  table.insert(zombies, zombie)
end

return spawnZombie
