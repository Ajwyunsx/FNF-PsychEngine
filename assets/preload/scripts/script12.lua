chromatic = 0;
function onCreatePost() 
initLuaShader("chromeVcr")
    
    makeLuaSprite("temporaryShader1")
    setSpriteShader("temporaryShader1", "chromeVcr")
    
    makeLuaSprite('shaderXb',nil,0,0)
    makeLuaSprite('shaderXr',nil,0,0)
    makeLuaSprite('shaderXg',nil,0,0)
		runHaxeCode([[

			trace(ShaderFilter);

			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader1").shader)]);
		]])
		addHaxeLibrary("ShaderFilter1", "openfl.filters")
		
triggerEvent('glitchy transition', '0.002')
end

function onEvent(name, value1, value2)
if name == 'glitchy transition' then
chromatic = chromatic + value1

end
end

function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i)
return from+(to-from)*i
end

function opponentNoteHit(id,noteData,noteType,isSusNote)
if noteType =='GF Sing But Not Visible Note' then
notGF = false
else
notGF = true
end

if notGF and math.random(1,2) == 1 then
    setProperty('shaderXb.x',chromatic * getRandomFloat(-2, 2))
    doTweenX('shaderbLol','shaderXb',0,0.2,'linear')
    --
    setProperty('shaderXr.x',chromatic * getRandomFloat(-2, 2))
    doTweenX('shaderrLol','shaderXr',0,0.2,'linear')
    --
    setProperty('shaderXg.x',chromatic * getRandomFloat(-2, 2))
    doTweenX('shadergbLol','shaderXg',0,0.2,'linear')
end
end

function onUpdate(elapsed)
--setShaderFloat("temporaryShader1", "bOffset", chromeOffset * 0);
--    setShaderFloat("temporaryShader1", "rOffset", chromeOffset * 0);
--    setShaderFloat("temporaryShader1", "gOffset", chromeOffset * 0);
  local  singValueb = getProperty('shaderXb.x')
        setShaderFloat('temporaryShader1', "bOffset", singValueb)
        
        local  singValuer = getProperty('shaderXr.x')
        setShaderFloat('temporaryShader1', "rOffset", singValuer)
        
        local  singValueg = getProperty('shaderXg.x')
        setShaderFloat('temporaryShader1', "gOffset", singValueg)
end

function onTweenCompleted(tag)
    if tag == 'shaderbLol' then
        setProperty('shaderXb.x',0)
    end
    
    if tag == 'shaderrLol' then
        setProperty('shaderXr.x',0)
    end
    
    if tag == 'shadergLol' then
        setProperty('shaderXg.x',0)
    end
end

function onSongStart()
--triggerEvent('glitchy transition', '0.001')
end
