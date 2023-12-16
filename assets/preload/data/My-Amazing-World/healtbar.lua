bordersSize = 90

function onCreatePost()
runTimer('fix',2)
makeLuaSprite('cinematicBorder1',nil,0,0)
        makeLuaSprite('cinematicBorder2',nil,0,screenHeight - bordersSize)
        for borders = 1,2 do
            makeGraphic('cinematicBorder'..borders,screenWidth+2,bordersSize,'000000')
            setObjectCamera('cinematicBorder'..borders,'camHUD')
            addLuaSprite('cinematicBorder'..borders,false)
            end

makeAnimatedLuaSprite('healthBarScript','healthbar/healthbarShader',50,getProperty('healthBar.y')-20);
scaleObject('healthBarScript',1.2,1.2)
makeAnimatedLuaSprite('healthBarScript2','healthbar/healthbarShader2',getProperty('healthBarScript.x'),getProperty('healthBarScript.y'));
scaleObject('healthBarScript2',1.2,1.2)
for t=1,41 do
addAnimationByPrefix('healthBarScript', 'health'..t, 'healthbar'..t..'_', 18, true);
addAnimationByPrefix('healthBarScript2', 'health'..t, 'healthbar'..t..'_', 18, true);
end
setObjectCamera('healthBarScript', 'camHUD')
setScrollFactor('healthBarScript', 0.9, 0.9)
addLuaSprite('healthBarScript')

setObjectCamera('healthBarScript2', 'camHUD')
setScrollFactor('healthBarScript2', 0.9, 0.9)
addLuaSprite('healthBarScript2')

setProperty('healthBarScript.visible',true)
 setProperty('healthBarScript2.visible',false)
if downscroll then
setProperty('iconP1.y', 20)
setProperty('iconP2.y',10)
else
setProperty('iconP1.y', 560)
setProperty('iconP2.y',580)
--setProperty('healthBarScript.y',550)
end
end

function onCreate()
setProperty('healthBar.visible', false);
setProperty('healthBarBG.visible', false);    
end

function opponentNoteHit()
resetHealthBar()
end

function goodNoteHit()
resetHealthBar()
end

function resetHealthBar()
    frame = (health*20)
    anim = math.ceil(frame)
    objectPlayAnimation('healthBarScript','health'..anim,true)
    objectPlayAnimation('healthBarScript2','health'..anim,true)
    end
    
function onUpdatePost(elapsed)
--setProperty('iconP1.x', getProperty('healthBarScript.x')+ 550)
setProperty('iconP2.x', getProperty('healthBarScript.x')-10)
health = getProperty('health')
end

function onTimerCompleted(tag)
if tag == 'fix' then
resetHealthBar()
end
end

function onBeatHit()
end