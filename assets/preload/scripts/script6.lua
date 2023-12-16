function onCreatePost()
initLuaShader("colorInversion")
setSpriteShader("dad", "colorInversion")
setShaderInt("dad", "invert", 0)
setSpriteShader("Jake", "colorInversion")
setShaderInt("Jake", "invert", 0)
end

function opponentNoteHit(id, derection, noteType, isSustainNote)

if noteType == 'Glitch Note' and getProperty('dad.curCharacter') ~='finn-hurting' then
setSpriteShader("dad", "colorInversion")
setShaderInt("dad", "invert", 1)
setShaderFloat('dad', 'binaryIntensity', math.random(-8,-5)/10)
runTimer('resetColor',0.02)
elseif noteType == 'Glitch Note' and getProperty('dad.curCharacter') =='finn-hurting' then
setSpriteShader("dad", "colorInversion")
setShaderInt("dad", "invert", 1)
setShaderFloat('dad', 'binaryIntensity', math.random(-8,-5)/10)
runTimer('resetColor',0.08)
end

if noteType == 'Second Char Glitch' then
setSpriteShader("Jake", "colorInversion")
setShaderInt("Jake", "invert", 1)
--setProperty('jake.color',getColorFromHex('ff0000'))
runTimer('resetColorJake',0.02)
setShaderFloat('Jake', 'binaryIntensity', math.random(-12,-6)/10)
end

end

function onTimerCompleted(tag)
if tag == 'resetColor' then
setProperty('dad.color',getColorFromHex('ffffff'))
setSpriteShader("dad", "colorInversion")
setShaderInt("dad", "invert", 0)
setShaderFloat('dad', 'binaryIntensity', 30.0)
end

if tag == 'resetColorJake' then
setSpriteShader("Jake", "colorInversion")
setShaderInt("Jake", "invert", 0)
setProperty('Jake.color',getColorFromHex('ffffff'))
setShaderFloat('Jake', 'binaryIntensity', 30.0)
end
end