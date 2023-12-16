speed = 0.07
offset = 0.2
niScale = 0.8
bfScale = 1
fix1 = true
function onCreatePost()
initLuaShader("NewGlitch2")
end

function onEvent(name,value1,value2)
if name == 'IconChange' then
if value2 == 'yes' then
gf = 1
else
gf = 0
end
if gf == 0 then
makeLuaSprite('icon', 'icons/'..value1, 620, getProperty('iconP1.y'))
                setObjectCamera('icon', 'camHUD')
                setProperty('icon.flipX',true)
                addLuaSprite('icon', false)				
                
                makeLuaSprite('icon-loss', 'icons/'..value1..'-loss', 620, getProperty('iconP1.y'))
                setObjectCamera('icon-loss', 'camHUD')
                setProperty('icon-loss.visible',false)
                setProperty('icon-loss.flipX',true)
                addLuaSprite('icon-loss', false)     
                setSpriteShader("icon-loss", "NewGlitch2")
else
setSpriteShader("icon-loss", "NewGlitch2")
makeLuaSprite('icon', 'icons/'..value1, 620, getProperty('iconP1.y'))
                setObjectCamera('icon', 'camHUD')
                setProperty('icon.flipX',true)
                addLuaSprite('icon', true)				
                
                makeLuaSprite('icon-loss', 'icons/'..value1..'-loss', 620, getProperty('iconP1.y'))
                setObjectCamera('icon-loss', 'camHUD')
                setProperty('icon-loss.visible',false)
                setProperty('icon-loss.flipX',true)
                addLuaSprite('icon-loss', true)     
setSpriteShader("icon-loss", "NewGlitch2")
end
end
--Value 1 is newIcon, Value 2 is IconP1
if name == 'VisibleIcon' then
if value1 == 'no' then
setProperty('icon.alpha',0)
setProperty('icon-loss.alpha',0)
elseif value1 == 'yes' then
setProperty('icon.alpha',1)
setProperty('icon-loss.alpha',1)
end
if value2 == 'no' then
setProperty('iconP1.visible',false)
elseif value2 == 'yes' then
setProperty('iconP1.visible',true)
end
end
end

function onUpdatePost()
if getProperty('icon.scale.x') > niScale or getProperty('icon.scale.y') > niScale then
	setProperty('icon.scale.x', getProperty('icon.scale.x') - speed)
	setProperty('icon.scale.y', getProperty('icon.scale.y') -  speed)
    setProperty('icon-loss.scale.x', getProperty('icon.scale.x'))
	setProperty('icon-loss.scale.y', getProperty('icon.scale.y'))
	end
	
	
	if gf == 0 then
  setProperty('icon.x', getProperty('healthBarScript.x')+ 640)
  setProperty('icon.y', getProperty('healthBarScript.y')- 80)  
  setProperty('iconP1.x', getProperty('healthBarScript.x')+ 570)
  setProperty('iconP1.y', getProperty('healthBarScript.y')- 40)  
  niScale = 0.8
  bfScale = 1
  else
  setProperty('icon.x', getProperty('healthBarScript.x')+ 570)
  setProperty('icon.y', getProperty('healthBarScript.y')- 40)  
  setProperty('iconP1.x', getProperty('healthBarScript.x')+ 640)
  setProperty('iconP1.y', getProperty('healthBarScript.y')- 80)  
  niScale = 1
  bfScale = 0.8
  end
  setProperty('icon-loss.x', getProperty('icon.x'))
  setProperty('icon-loss.y', getProperty('icon.y'))  
    if getProperty('healthBar.percent') < 25 then
       setProperty('icon-loss.visible',true)
       setProperty('icon.visible',false)
       else
       setProperty('icon-loss.visible',false)
       setProperty('icon.visible',true)
	end
	
	if getProperty('iconP1.scale.x') > bfScale then
	setProperty('iconP1.scale.x', getProperty('iconP1.scale.x') - speed)
	setProperty('iconP1.scale.y', getProperty('iconP1.scale.y') -  speed)
	end
	
	if getProperty('iconP1.scale.x') <= bfScale or getProperty('iconP1.scale.y') <= bfScale then
	fix1 = false
	end
	
	if fix1 == false then
	setProperty('iconP1.scale.x',bfScale)
	setProperty('iconP1.scale.y',bfScale)
	end
	end
	
	function goodNoteHit(id,data,type,sus)
if type == 'GF Sing' or (gfSection and type =='' )then
	setProperty('icon.scale.x',  niScale + offset)
	setProperty('icon.scale.y', niScale + offset)
setProperty('icon-loss.scale.x', niScale + offset)
	setProperty('icon-loss.scale.y', niScale + offset)
	end
	if (not gfSection and type == '' ) or type == 'Attack Note' or type == 'Dodge Note' then
	setProperty('iconP1.scale.x', bfScale + offset)
	setProperty('iconP1.scale.y', bfScale + offset)
	fix1 = true
	runTimer('fix1',0.3)
	end
	end
	
	function opponentNoteHit(id,data,type,sus)
if type == 'GF Sing' or type == 'GF Sing But Not Visible Note' then
setProperty('icon.scale.x',  niScale + offset)
setProperty('icon.scale.y', niScale + offset)
setProperty('icon-loss.scale.x', niScale + offset)
setProperty('icon-loss.scale.y', niScale + offset)
	end
	end
	
	function onTimerCompleted(tag)
	if tag == 'fix1' then
	fix1 = false
	end
	end 
	
	function onStepHit()
setShaderFloat('icon-loss', 'binaryIntensity', math.random(2,6)+math.random(1,2)/2)
end