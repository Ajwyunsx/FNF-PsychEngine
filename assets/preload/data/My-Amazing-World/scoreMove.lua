local pixel = 5
local scoreAngle = 4
local scoreTimeAngle = 0.5
fix = true
fix1 = false
function onSongStart()
scoreGF = false
onHUDUpdate()
end

function onCreatePost()
runTimer('fix',2)
if songName =='Blessed By Swords' then
fix = false
fix1 = true
end
end

function goodNoteHit(id,data,type,sus)
if (type =='GF Sing' and not sus) or (gfSection and type =='' and not sus) then
scoreGF = true 
onHUDUpdate()
elseif (not gfSection and not sus) then
onHUDUpdate()
scoreGF = false
end
    end
    
    function onTweenCompleted(tag)
    if tag =='scoreAngleF' then
    setProperty('scoreTxt.x',scoreX)
                setPtoperty('scoreTxt.y',scoreY)
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'cubeOut')
                end
                end
                
                function onHUDUpdate()
              if scoreGF then
 setProperty('scoreTxt.color', getIconColor('gf'))
 setProperty('healthBarScript2.visible',true)
 setProperty('healthBarScript.visible',false)
 if songName =='Suffering-Siblings' or songName =='Forgotten-World'  then
               else
               if fix1 == true  and fix == false then
 triggerEvent('IconChange',getProperty('gf.curCharacter'),'yes')
 fix1 = false
 fix = true
end
end

elseif not scoreGF then
setProperty('healthBarScript.visible',true)
 setProperty('healthBarScript2.visible',false)
 setProperty('scoreTxt.color', getIconColor('boyfriend')) 
 if songName =='Suffering-Siblings' or songName =='Forgotten-World' then
               else
               if fix == true and fix1 == false then
 triggerEvent('IconChange',getProperty('gf.curCharacter'),'no')
 fix = false
 fix1 = true
 end
end
end
end

function onTimerCompleted(tag)
if tag == 'fix' then
onHUDUpdate()
end
end
function getIconColor(chr)
	local chr = chr or "dad"
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
	end
	
	function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end