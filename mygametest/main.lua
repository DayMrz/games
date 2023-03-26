function love.load()
  target = {}
  target.x = 300
  target.y = 300
  target.radius = 50

  score = 0
  timer = 0

  gameFont = love.graphics.newFont(50)

  circleColor = {111/255, 142/255, 241/255}
end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(circleColor)
  love.graphics.circle("fill", target.x, target.y, target.radius)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(gameFont)
  love.graphics.print(score, 0, 0)
end

function love.mousepressed( x, y, button, istouch, presses )
  if button == 1 then
    local mouseToTarget = distanceBetween(x, y, target.x, target.y)
    if mouseToTarget < target.radius then
      score = score + 1
      target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
      target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
      circleColor = {0.5+0.5*math.random(), 0.5+0.5*math.random(), 0.5+0.5*math.random()}
    end
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end

-- the center of the circle represents de x,y value, and the mouse clicked will have its own x,y value. I need to know if the mouse is been pressed inside or outside the circle in order to add or not value to the score.
-- to calculate if the mouse is clicking the circle i need to take the distance between the mouse pressed and the target, which is the center of the circle.
-- taking into account the lenght of the radius of the circle i can messure the distance between the target.mouse and the circle. 
  -- which means if the distante from the target is less than 50 (target.radius) the mouse is been pressed inside the circle and larger than 50 won't add any value in the score because it is been pressed outside.