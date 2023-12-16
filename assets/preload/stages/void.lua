local xx = 1300
local yy = 950
local xx2=1700
local yy2=950
local camZoom =0.7
local camZoom2 =0.72
ofs =20
local followchars = false
speed = 1
offset = 770
function onSongStart()
followchars = true
end
function onCreatePost()
    runTimer('fixBF',2.75)
    makeAnimatedLuaSprite('void','images/void/void',-100, -200);
    addAnimationByPrefix('void','idle','idle',24,true)
    scaleObject('void',2.8,2.8)
    setScrollFactor('void',0.6,0.6)
    addLuaSprite('void')
    
    makeAnimatedLuaSprite('glitch','images/void/gumballglitchbg',200, 200);
    addAnimationByPrefix('glitch', 'circle','spin', 48,true)
    --objectPlayAnimation('glitch','circle',true)
    scaleObject('glitch',4,4)
    setProperty('glitch.alpha',0)
    setScrollFactor('glitch',1,1)
    addLuaSprite('glitch')
-- setSpriteShader("void", "CrRT")
   
    makeLuaSprite('rock3','images/void/Ilustracion_sin_titulo-5',0, -200);
    scaleObject('rock3',2.5,2.5)
    setScrollFactor('rock3',0.9,0.9)
    addLuaSprite('rock3')
    
    makeLuaSprite('rock4','images/void/Ilustracion_sin_titulo-6',0, -200);
    scaleObject('rock4',2.5,2.5)
    setScrollFactor('rock4',0.85,0.85)
    addLuaSprite('rock4')
    
    makeLuaSprite('house','images/void/Ilustracion_sin_titulo-2',0, -200);
    scaleObject('house',2.5,2.5)
    setScrollFactor('house',0.85,0.85)
    addLuaSprite('house')
    
    makeLuaSprite('rock','images/void/Ilustracion_sin_titulo-3',0, -200);
    scaleObject('rock',2.5,2.5)
    setScrollFactor('rock',1,1)
    addLuaSprite('rock')
    
    makeLuaSprite('rock2','images/void/Ilustracion_sin_titulo-4',0, -200);
    scaleObject('rock2',2.5,2.5)
    setScrollFactor('rock2',1.1,1.1)
    addLuaSprite('rock2')

makeLuaSprite("black",'', 0, 0);
makeGraphic("black",2737,1409,'000000')
setObjectCamera("black", 'camOther')
setProperty('black.alpha',0)
addLuaSprite('black')   

--    if (ClientPrefs.lowQuality){
	
    
    makeLuaSprite('wtf','images/void/Ilustracion_sin_titulo-7',0, -200);
    scaleObject('wtf',2.5,2.5)
    setScrollFactor('wtf',1,1)
    addLuaSprite('wtf',true)
    
    makeLuaSprite("green",'', 0, 0);
setProperty('green.alpha',0)
makeGraphic("green",2737,1509,'00F301')
setObjectCamera("green", 'camGame')
addLuaSprite('green',true)   

makeLuaSprite("grey",'', 0, 0);
setProperty('grey.alpha',0.1)
makeGraphic("grey",2737,1509,'000000')
setObjectCamera("grey", 'camGame')
addLuaSprite('grey',true)   
 --   }
    setTextFont('scoreTxt', 'gumball.ttf')
   setTextFont('healthCounter', 'gumball.ttf')
   setTextFont('timeTxt', 'gumball.ttf')
   setTextFont('botplayTxt', 'gumball.ttf')
   setTextFont('cpuControlledTxt', 'gumball.ttf')
   setTextFont('judgementCounter', 'gumball.ttf')
end
    
    function onUpdatePost(elapsed)
if curStep >= 0 and curStep < 999999999999 then
        setProperty('house.angle',8 * math.sin(getPropertyFromClass('Conductor', 'songPosition') / (1500/speed) ))
        setProperty('rock.angle',3* math.sin(getPropertyFromClass('Conductor', 'songPosition') / (1700/speed) ))
        setProperty('wtf.angle',4.5 * math.sin(getPropertyFromClass('Conductor', 'songPosition') / (3000/speed)))
        setProperty('rock2.angle',2 * math.sin(getPropertyFromClass('Conductor', 'songPosition') / (2500/speed)))
  setProperty('rock3.angle',360 * math.sin(getPropertyFromClass('Conductor', 'songPosition') / (20000/(speed*1.5)) ))
  setProperty('rock4.angle',6* math.sin(getPropertyFromClass('Conductor', 'songPosition') / (5000/speed)))
  setProperty('house.y', -200 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / 2000) * ((getPropertyFromClass('Conductor', 'bpm')/ 60) * 1.0)) * 40)
  setProperty('wtf.y', -200 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (3000/speed)) * ((getPropertyFromClass('Conductor', 'bpm')/ 60) * 1.0)) * 60)
  setProperty('camGame.y', math.sin((getPropertyFromClass('Conductor', 'songPosition') / (4000/(speed*0.5))) * ((getPropertyFromClass('Conductor', 'bpm')/ 60) * 1.0)) * 20)
  if ending then
  setProperty('boyfriend.angle',0)
  setProperty('dad.angle',0)
  setProperty('gf.angle',0)
  setProperty('boyfriend.y',470)
  setProperty('dad.y',470)
  setProperty('gf.y',470)
  setProperty('grey.alpha',0)
  else 
  setProperty('boyfriend.y', offset + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) ) *20)
  setProperty('gf.y', 870 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) )*20)
  setProperty('dad.y', 770 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) )* -20)
  setProperty('boyfriend.x', offset+ 950 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) ) * -20)
  setProperty('gf.x', 1670 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) )* -20)
  setProperty('dad.x', 900 + math.sin((getPropertyFromClass('Conductor', 'songPosition') / (1700/speed)) )* -20)
  setProperty('boyfriend.angle',getProperty('rock.angle'))
  setProperty('dad.angle',getProperty('rock.aggle'))
  setProperty('gf.angle',getProperty('rock.angle'))
  end
  end
  if curStep == 99999999999999999 then
        setProperty('house.angle',0)
        setProperty('wtf.angle',0)
  setProperty('rock3.angle',0)
  setProperty('rock2.angle',0)
  setProperty('rock4.angle',0)
    end
    
    if curStep == 1815 then
followchars =false
end

if curStep == 1824 then
setProperty('camHUD.alpha',1)
cameraFlash('camGame','ffffff',1)
triggerEvent('Set Cam Zoom','0.75','0.6')
followchars = true
end

if curStep ==2048 then
ending= true
end
end

function onEvent(name,value1,value2)
if name =='EffectRetcon' then
if value1 == 'on' then
cameraFlash('camOther','ffffff',0.8)
setProperty('green.alpha',0.1)
setProperty('glitch.alpha',1)
doTweenAlpha('endEffect2','grey',0,0.5,'linear')
end
if value1 == 'off' then
cameraFlash('camOther','ffffff',0.8)
doTweenAlpha('endEffect','green',0,0.5,'linear')
doTweenAlpha('endEffect2','grey',0.2,0.5,'linear')
doTweenAlpha('endEffect3','glitch',0,0.5,'linear')
end
speed = value2
end
end

function onTimerCompleted(tag)
if tag == 'fixBF' then
offset = 920
end
end

function onUpdate()
          setShaderFloat('void','iTime',os.clock()) 
          --setShaderFloat('glitch','SPEED',10000.0)
if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',getProperty('defaultCamZoom'))
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                doTweenAngle('camGameAngle','camGame',1.2,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                doTweenAngle('camGameAngle','camGame',-1.2,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
                doTweenAngle('camGameAngle','camGame',1.2,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
                doTweenAngle('camGameAngle','camGame',-1.2,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
            doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',getProperty('defaultCamZoom'))
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
                doTweenAngle('camGameAngle','camGame',1.2,0.5,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
                doTweenAngle('camGameAngle','camGame',-1.2,0.5,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            doTweenAngle('camGameAngle','camGame',0,0.5,'linear')
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

