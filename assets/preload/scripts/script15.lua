ofs= 5
scoreAngle = 2
scoreTimeAngle = 0.12
fix = true 
fix1 = false

function onCreatePost()
if songName == "Child's Play" or songName == "My Amazing World" or songName == "Retcon" then
xx2= -250
yy2= getProperty('healthBar.y')+40
else
xx2= 0
yy2= getProperty('healthBar.y')+40
end
xy = 4
end

function goodNoteHit(id,data,type,sus)
if type =='GF Sing' and not sus then
scoreGF = true 
onHUDUpdate()
elseif not sus then
onHUDUpdate()
scoreGF = false
end
if not sus then
xy = data
runTimer('Nor',0.1)
end
    end
    
 function onUpdate()   
            if xy== 0 then
                setProperty('scoreTxt.x',xx2-ofs)
                setProperty('scoreTxt.y',yy2)
                setProperty('scoreTxt.angle',scoreAngle)
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
            end
            if xy==3 then
                setProperty('scoreTxt.x',xx2+ofs)
                setProperty('scoreTxt.y',yy2)
                setProperty('scoreTxt.angle',-scoreAngle)
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
            end
            if xy==2 then
                setProperty('scoreTxt.x',xx2)
                setProperty('scoreTxt.y',yy2-ofs/2)
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
            end
            if xy==1 then
                setProperty('scoreTxt.x',xx2)
                setProperty('scoreTxt.y',yy2+ofs/2)
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
            end
             if xy==4 then
                doTweenX('scoreX','scoreTxt',xx2,scoreTimeAngle/2,'sineInOut')
                doTweenY('scoreY','scoreTxt',yy2,scoreTimeAngle/2,'sineInOut')
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
            end
            
end

    function onTimerCompleted(tag)
   if tag =='Nor' then
  xy = 4
                end
               end
                
 --   function onTweenCompleted(tag)
 --   if tag =='scoreAngle' then
--    doTweenAngle('scoreAngle2','scoreTxt',0,scoreTimeAngle,'sineInOut')
 --   setProperty('scoreTxt.x',xx2)
   --             setProperty('scoreTxt.y',yy2)
    --           end
    --         end
                
                function onStepHit()
                doTweenAngle('scoreAngle','scoreTxt',0,scoreTimeAngle,'sineInOut')
                end
                
                function onHUDUpdate()
              if scoreGF then
 setProperty('scoreTxt.color', getIconColor('gf')) 

elseif not scoreGF then
 setProperty('scoreTxt.color', getIconColor('boyfriend')) 
end
end


function getIconColor(chr)
	local chr = chr or "dad"
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
	end
	
	function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end