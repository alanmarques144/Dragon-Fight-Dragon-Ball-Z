local  anim8 = require 'anim8'
local Menu = true
animation = nil
animation2 = nil



function love.load()




playerX = 100
playerY =  500
player2X = 1000
player2Y =  500
retx = 200                               -- POS(X) DA BARRA DE VIDA PLAYER1
ret2x = 744								 -- POS(X) DA BARRA DE VIDA PLAYER2
estavivo = true
estavivo2 = true


	love.window.setFullscreen(true, "desktop")
	imgMenu = love.graphics.newImage("fotomenu.png")
	imagem = love.graphics.newImage("thunder.png")
	imagem2 = love.graphics.newImage("thunder2.png")
	fundo = love.graphics.newImage("og.png")
	score = love.graphics.newImage("barra.png")
	gameover1 = love.graphics.newImage("WIN2.png")
	gameover2 = love.graphics.newImage("WIN1.png")
	local g = anim8.newGrid(64, 64, imagem:getWidth(), imagem:getHeight())
	animationStopedRight = anim8.newAnimation( g('6-9',4), 0.1)
	animationStopedLeft = anim8.newAnimation( g('6-9',3), 0.1)
	animationUp = anim8.newAnimation( g('1-9',5), 0.09)
	animationDown = anim8.newAnimation( g('1-9',3), 0.09)
	animationLeft = anim8.newAnimation( g('1-9',2), 0.09)
	animationRight = anim8.newAnimation( g('1-9',1), 0.09)
	animationPunchRight = anim8.newAnimation( g('1-5',3), 0.09 )
	animationPunchLeft = anim8.newAnimation( g('1-5',4), 0.09)
	animationFallLeft = anim8.newAnimation( g('1-3',7), 0.07)
	animationFallRight = anim8.newAnimation( g('1-3',6), 0.07)
	animation = animationDown
	animationwin = anim8.newAnimation( g('1-5',5), 0.09)
	local f = anim8.newGrid(64, 64, imagem2:getWidth(), imagem2:getHeight())
	animationStopedRight2 = anim8.newAnimation( f('6-9',4), 0.1)
	animationStopedLeft2 = anim8.newAnimation( f('6-9',3), 0.1)
	animationUp2 = anim8.newAnimation( f('1-9',1), 0.1)
	animationDown2 = anim8.newAnimation( f('1-9',3), 0.1)
	animationLeft2 = anim8.newAnimation( f('1-9',2), 0.1)
	animationRight2 = anim8.newAnimation( f('1-9',1), 0.1)
	animation2FallLeft = anim8.newAnimation( f('1-3',7), 0.07)
	animation2FallRight = anim8.newAnimation( f('1-3',6), 0.07)
	animation2 = animationDown
	animationPunchRight2 = anim8.newAnimation( f('1-5',3), 0.09 )
	animationPunchLeft2 = anim8.newAnimation( f('1-5',4), 0.1)
	animationwin2 = anim8.newAnimation( f('1-5',5), 0.1)
	animation2 = animationStopedLeft2
	animation = animationStopedRight
end



function love.update(dt)

animationUp : update (dt)
animationDown : update (dt)
animationFallRight : update (dt)
animationFallLeft : update (dt)
animation2FallRight : update (dt)
animation2FallLeft : update (dt)
animationRight : update (dt)
animationPunchRight : update (dt)
animationPunchLeft: update (dt)
animationPunchLeft2: update (dt)
animationUp2 : update (dt)
animationDown2 : update (dt)
animationLeft2 : update (dt)
animationRight2 : update (dt)
animationStopedRight2 : update (dt)
animationStopedLeft2 : update (dt)
animationStopedRight : update (dt)
animationStopedLeft : update (dt)


--COMANDOS PLAYER 1

if love.keyboard.isDown("left") and playerX > -50  then
		animation = animationLeft
		playerX = playerX - 550 * dt
		animationLeft : update (dt)
	elseif love.keyboard.isDown("right") and playerX < 1190  then
		animation = animationRight
		playerX = playerX + 550 * dt
		animationRight : update (dt)
	elseif animation == animationLeft or animation == animationPunchLeft or animation == animationFallRight  then
		animation = animationStopedLeft
		animationStopedLeft : update (dt)
	elseif animation == animationRight or animation == animationPunchRight or animation == animationFallLeft then
		animation = animationStopedRight
end

-----------------------------------------------------------------------------------------------------
--COMANDOS PLAYER 2
if love.keyboard.isDown("a") and player2X > -50  then
		animation2 = animationLeft2
		player2X = player2X - 550 * dt
	elseif love.keyboard.isDown("d") and player2X < 1190  then
		animation2 = animationRight2
		player2X = player2X + 550 * dt
	--SOCO PLAYER 2
	elseif love.keyboard.isDown("z") and (player2X < playerX+150 and  player2X > playerX)   then
		animation = animationFallLeft
		animation2 = animationPunchLeft2
		retx= retx - 50 * dt
		playerX = playerX - 45 * dt
	elseif love.keyboard.isDown("x") and (player2X > playerX-150 and player2X < playerX )  then
		animation = animationFallRight
		animation2 = animationPunchRight2
		retx= retx - 50 * dt
		playerX = playerX + 45 * dt
	elseif love.keyboard.isDown("z")   then
		animation2 = animationPunchLeft2
	elseif love.keyboard.isDown("x")   then
		animation2 = animationPunchRight2
		animationPunchRight2 : update (dt)
	elseif animation2 == animationLeft2 or animation2 == animationPunchLeft2 or animation2 == animation2FallRight then
		animation2 = animationStopedLeft2
	elseif animation2 == animationRight2 or animation2 == animationPunchRight2 or animation2 == animation2FallLeft then
		animation2 = animationStopedRight2
end


	----SOCO PLAYER 1
if love.keyboard.isDown("n") and (playerX < player2X+150 and  playerX > player2X)   then
		animation = animationPunchLeft
		animation2 = animation2FallLeft
		ret2x= ret2x + 50 * dt
		player2X = player2X - 45 * dt
	elseif love.keyboard.isDown("m") and (playerX > player2X-150 and playerX < player2X )then
		animation = animationPunchRight
		animation2 = animation2FallRight
		ret2x= ret2x + 50 * dt
		player2X = player2X + 45 * dt
	elseif love.keyboard.isDown("m")   then
		animation = animationPunchRight
	elseif love.keyboard.isDown("n")   then
		animation = animationPunchLeft
end

function drawmenu()
	love.graphics.draw(imgMenu)
end

if love.keyboard.isDown("return") then
		Menu = false

end

animationwin1 = animationwin
animationwin1 : update (dt)
animationwin2  = animationwin2
animationwin2  : update (dt)


if love.keyboard.isDown("backspace") then
	Menu = true
end


--VIDA PLAYER 1
if retx+420  >= 200 then
	estavivo = true
else
	estavivo = false
end
--VIDA PLAYER 2
if ret2x <= 1164 then
	estavivo2 = true
else
	estavivo2 = false
end
	
if love.keyboard.isDown("escape")   then
	os.exit()
end
	
end
function reset(dt) --função para der reset no jogo
	if (not(estavivO) or not(estavivo2)) and love.keyboard.isDown("return") then 
		love.load()
	
	end
		
end
	
	


function love.draw()

	love.graphics.draw(fundo)

if Menu == true  then
	drawmenu()
elseif estavivo == true and estavivo2 == true then
		if estavivo == true  then
		animation:draw(imagem,playerX,playerY,0,3.5,3.5)
		end
		if estavivo2 == true then
		animation2:draw(imagem2,player2X,player2Y,0,3.5,3.5)
		

		end
	love.graphics.setColor(168, 168, 168)--COR CINZA
	love.graphics.rectangle("fill",200, 65, 420, 60)
	love.graphics.rectangle("fill",744, 65, 420, 60)
	love.graphics.setColor(0, 255, 0)--COR VERDE
	love.graphics.rectangle("fill", retx,65 ,420, 60)--BARRA DE VIDA1
	love.graphics.rectangle("fill", ret2x, 65, 420, 60)--BARRA DE VIDA2
	love.graphics.setColor(255, 255, 255)--BRANCO
	love.graphics.draw(score)

end





if estavivo == false then
	animationwin2:draw(imagem2,650,player2Y,0,3.5,3.5)
	love.graphics.draw(gameover1)
    reset(dt)
	
end


if estavivo2 == false then
	animationwin1:draw(imagem,650,playerY,0,3.5,3.5)
	love.graphics.draw(gameover2)
	reset(dt)
	
end


end







