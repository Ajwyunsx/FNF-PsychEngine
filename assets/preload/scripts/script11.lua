--scripts by NTH208
speedUpGlitch0 = false
speedUpGlitch1 = false
speedUpGlitch2 = false
speedUpGlitch3 = false
function onCreatePost()
initLuaShader("NewGlitch2")

for i=0,3 do
setSpriteShader('opponentStrums.members['..i..']', 'NewGlitch2')
--setSpriteShader('playerStrums.members['..i..']', 'NewGlitch2')
 end       
        
    --    for i=0,3 do
  --      setProperty('opponentStrums.members['..i..'].useFramePixels', true)
  --      end
    for i = 0,getProperty('unspawnNotes.length')-1 do
    if getPropertyFromGroup('unspawnNotes',i,'gfNote') then
            if not getPropertyFromGroup('unspawnNotes',i,'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'visible', false)
            end
        end
      end
     end
        
        function onSongStart()
        for i = 0,3 do
        noteTweenAlpha('note'..i,i,1,0.0001,'linear')
         end
         end
         
        function onUpdate(e)
        for i =0,3 do
        setShaderFloat("opponentStrums.members["..i.."]", "iTime", os.clock())
    --setShaderFloat("playerStrums.members["..i.."]", "iTime", os.clock())
    end
    --Speed Glitch
    if speedUpGlitch0 then
    --random = math.random(5,15)
    setShaderFloat('opponentStrums.members[0]', 'binaryIntensity', math.random(2,5)+ 1/math.random(1,3))
    end
    
    if speedUpGlitch1 then
    setShaderFloat('opponentStrums.members[1]', 'binaryIntensity', math.random(2,5)+ 1/math.random(1,3))
    end
    
    if speedUpGlitch2 then
    setShaderFloat('opponentStrums.members[2]', 'binaryIntensity', math.random(2,5)+ 1/math.random(1,3))
    end
    
    if speedUpGlitch3 then
    setShaderFloat('opponentStrums.members[3]', 'binaryIntensity', math.random(2,5)+ 1/math.random(1,3))
    end
    
    end
    
    function opponentNoteHit(id,data,type,sus)
    if type == 'GF Sing But Not Visible Note' or type == 'GF Sing' then
    else
    if data ==0 then
    speedUpGlitch0 = true
    runTimer('outSpeed0',0.15)
    end
    
    if data ==1 then
    speedUpGlitch1 = true
    runTimer('outSpeed1',0.15)
    end
    
    if data ==2 then
    speedUpGlitch2 = true
    runTimer('outSpeed2',0.15)
    end
    
    if data ==3 then
    speedUpGlitch3 = true
    runTimer('outSpeed3',0.15)
    end
    end
    if getPropertyFromGroup('notes',id,'gfNote') or type == 'GF Sing But Not Visible Note' then
    runHaxeCode('game.opponentStrums.members['..data..'].playAnim(\'static\', true);');
    end
    end
    
    function onTimerCompleted(tag)
    if tag== 'outSpeed0' then
    speedUpGlitch0 = false
    end
    
    if tag== 'outSpeed1' then
    speedUpGlitch1 = false
    end
    
    if tag== 'outSpeed2' then
    speedUpGlitch2 = false
    end
    
    if tag== 'outSpeed3' then
    speedUpGlitch3 = false
    end
    end
    
    function onStepHit()
    random = math.random(1.5,6)
    if math.random(1,2) == 1 then
    random = 20
    end
    for i=0,3 do
setShaderFloat('opponentStrums.members['..i..']', 'binaryIntensity', random+ 1/math.random(1,3))
--setSpriteShader('playerStrums.members['..i..']', 'NewGlitch2')  
end   
 end
    