
function onCreatePost()
end

function onStepHit()
initLuaShader("NewGlitch2")
--Opponent team
setSpriteShader("iconP2", "NewGlitch2")
--Bf team
setSpriteShader("iconP1", "NewGlitch2")
if getProperty('health') >= 1.6 then
setShaderFloat('iconP2', 'binaryIntensity', math.random(2,8)+(1/math.random(1,4)))--/math.random(1,1))
elseif getProperty('health') < 1.6 then
setShaderFloat('iconP2', 'binaryIntensity', 50)
end


if getProperty('health') >= 0.4 then
setShaderFloat('iconP1', 'binaryIntensity', 100)
elseif getProperty('health') < 0.4 then

setShaderFloat('iconP1', 'binaryIntensity', math.random(2,8)+(1/math.random(1,4)))--/math.random(1,1))
end
end

function opponentNoteHit(id,dir,type,sus)
if getProperty('health') > 0.2 and songName ~= "Child's Play" and type ~= 'GF Sing' and type ~= 'GF Sing But Not Visible Note' then
setProperty('health',getProperty('health')- 0.015)
end

if getProperty('health') > 0.2 and songName == "Child's Play" and type ~= 'GF Sing' and type ~= 'GF Sing But Not Visible Note' then
 setProperty('health',getProperty('health')- 0.006) 
end

if getProperty('health') > 0.3 and type =='Both Char Sing' then
setProperty('health',getProperty('health')- 0.015)
end

if getProperty('dad.curCharacter') == 'finn-hurting' and type =='Glitch Note' then
setProperty('health',getProperty('health') + 0.015)
end
end
