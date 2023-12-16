local xx = 2200
local yy = 1300
local xx2=2150
local yy2=1200
local ofs =20
local Angle = 2
local timeAngle =0.5
local followchars = true

function onCreate()

makeLuaSprite("blackOther",'', 0, 0);
makeGraphic("blackOther",2480,1420,'000000')
setProperty('blackOther.alpha',0)
setObjectCamera("blackOther", 'camOther')
addLuaSprite('blackOther')

makeLuaSprite("whiteOther",'', 0, 0);
makeGraphic("whiteOther",2480,1420,'FFFFFF')
setProperty('whiteOther.alpha',0)
setObjectCamera("whiteOther", 'camOther')
addLuaSprite('whiteOther')

makeLuaSprite('bg','images/lab/bg',900,525)
scaleObject('bg',1.3,1.3)
addLuaSprite('bg',false)

makeLuaSprite('dark','images/lab/dark',780,-800)
scaleObject('dark',1.5,1.5)
addLuaSprite('dark',true)

makeLuaSprite('light','images/lab/light',780,-800)
setProperty('light.alpha',0.8)
scaleObject('light',1.5,1.5)
addLuaSprite('light',true)
flickerTween = true

makeLuaSprite('buld','images/lab/bulb',100,145)
scaleObject('buld',1.3,1.3)
addLuaSprite('buld',true)

makeLuaSprite("blackGame",'', 900, 525);
makeGraphic("blackGame",3213,1660,'000000')
setProperty('blackGame.alpha',0)
setObjectCamera("blackGame", 'camGame')
addLuaSprite('blackGame')

makeLuaSprite("whiteGame",'', 900, 525);
makeGraphic("whiteGame",3213,1660,'ffffff')
setProperty('whiteGame.alpha',0)
setObjectCamera("whiteGame", 'camGame')
addLuaSprite('whiteGame')

doTweenAlpha('lightAlpha','light',math.random(2,8)/10,0.25,'linear')
setProperty('cameraSpeed',50)
triggerEvent('Camera Follow Pos','2300','1400')
end

function onCreatePost()
setTextFont('scoreTxt', 'Thunderman.ttf')
   setTextFont('healthCounter', 'Thunderman.ttf')
   setTextFont('timeTxt', 'Thunderman.ttf')
   setTextFont('botplayTxt', 'Thunderman.ttf')
   setTextFont('cpuControlledTxt', 'Thunderman.ttf')
   setTextFont('judgementCounter', 'Thunderman.ttf')

	setProperty('light.angle',math.sin((getPropertyFromClass('Conductor','songPosition')/ 1500) * ((getPropertyFromClass('Conductor', 'bpm') / 60) * 1.0)) * 8);                                           
	setProperty('dark.angle',getProperty('light.angle'));
	setProperty('bulb.angle', getProperty('light.angle'));
	end
	
	function onTweenCompleted(tag)
	if tag == 'lightAlpha' then
	doTweenAlpha('lightAlpha2','light',1,0.5,'bounceInOut')
	end
	
	if tag == 'lightAlpha2' then
	doTweenAlpha('lightAlpha','light',0.4,0.5,'bounceInOut')
	end
	end
	
	function onUpdate()
	if curStep >1 and curStep <10 then
	setProperty('cameraSpeed',2)
	xx = 1650
	yy = 1020
end
	if followchars == true  then
        if mustHitSection == false then
            setProperty('defaultCamZoom',getProperty('defaultCamZoom'))
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                doTweenAngle('camGameAngle','camGame',Angle,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                doTweenAngle('camGameAngle','camGame',-Angle,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                doTweenAngle('camGameAngle','camGame',Angle,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                doTweenAngle('camGameAngle','camGame',-Angle,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
            doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            
            if getProperty('Jake.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                doTweenAngle('camGameAngle','camGame',Angle,timeAngle,'linear')
            end
            if getProperty('Jake.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                doTweenAngle('camGameAngle','camGame',-Angle,timeAngle,'linear')
            end
            if getProperty('Jake.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('Jake.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
        else

            setProperty('defaultCamZoom',getProperty('defaultCamZoom'))
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                doTweenAngle('camGameAngle','camGame',Angle,timeAngle,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                doTweenAngle('camGameAngle','camGame',-Angle,timeAngle,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                doTweenAngle('camGameAngle','camGame',Angle,timeAngle,'linear')
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                doTweenAngle('camGameAngle','camGame',-Angle,timeAngle,'linear')
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                doTweenAngle('camGameAngle','camGame',0,timeAngle,'linear')
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
