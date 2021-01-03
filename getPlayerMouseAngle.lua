local function getPlayerMouseAngle(y1, y2, x1, x2)
  return math.atan2(y1 - y2, x1 - x2) + math.pi
end

return getPlayerMouseAngle
