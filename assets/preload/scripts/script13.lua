defultsfsb =0.85
speed = 0.07
offset = 0.20
bfScale = 1
niScale = 0.8
fix2 = true
fix1 = true

function onSongStart()
if songName == 'Blessed by Swords' then
	defultsfsb = 1
	end
	end
	
function opponentNoteHit(id,data,type,sus)
if type == 'Second Char Sing' or type == 'Second Char Glitch' or type == 'Both Char Sing' then
setProperty('iconJake.scale.x',  defultsfsb + offset)
	setProperty('iconJake.scale.y', defultsfsb + offset)
setProperty('jakelose.scale.x', defultsfsb + offset)
	setProperty('jakelose.scale.y', defultsfsb + offset)
	end
	
if type == 'GF Sing' or type == 'GF Sing But Not Visible Note' then
setProperty('IconPibby.scale.x',  defultsfsb + offset)
	setProperty('IconPibby.scale.y', defultsfsb + offset)
setProperty('pibbylose.scale.x', defultsfsb + offset)
	setProperty('pibbylose.scale.y', defultsfsb + offset)
	
	
	end
	if type =='' or type == 'Glitch Note' or type == 'Both Char Sing' then
	setProperty('iconP2.scale.x', 1 + offset)
	setProperty('iconP2.scale.y', 1+ offset)
	fix2 = true
	runTimer('fix2',0.3)
	end
	end
	
	function goodNoteHit(id,data,type,sus)
if type == 'GF Sing' then
setProperty('IconPibby.scale.x',  defultsfsb + offset)
	setProperty('IconPibby.scale.y', defultsfsb + offset)
setProperty('pibbylose.scale.x', defultsfsb + offset)
	setProperty('pibbylose.scale.y', defultsfsb + offset)
	

	end
	if (not gfSection and type == '' ) or type == 'Attack Note' or type == 'Dodge Note' then
	setProperty('iconP1.scale.x', bfScale + offset)
	setProperty('iconP1.scale.y', bfScale + offset)
	fix1 = true
	runTimer('fix1',0.3)
	end
	end
	
	function onUpdate()
	
	if getProperty('iconJake.scale.x') > defultsfsb then
	setProperty('iconJake.scale.x', getProperty('iconJake.scale.x') - speed)
	setProperty('iconJake.scale.y', getProperty('iconJake.scale.y') -  speed)
    setProperty('jakelose.scale.x', getProperty('jakelose.scale.x') -  speed)
	setProperty('jakelose.scale.y', getProperty('jakelose.scale.y') -  speed)
	end
	
	if getProperty('IconPibby.scale.x') > defultsfsb then
	setProperty('IconPibby.scale.x', getProperty('IconPibby.scale.x') - speed)
	setProperty('IconPibby.scale.y', getProperty('IconPibby.scale.y') -  speed)
    setProperty('pibbylose.scale.x', getProperty('pibbylose.scale.x') -  speed)
	setProperty('pibbylose.scale.y', getProperty('pibbylose.scale.y') -  speed)
	end
	
	if getProperty('iconP1.scale.x') > bfScale then
	setProperty('iconP1.scale.x', getProperty('iconP1.scale.x') - speed)
	setProperty('iconP1.scale.y', getProperty('iconP1.scale.y') -  speed)
	end
	if getProperty('iconP2.scale.x') > 1 then
	setProperty('iconP2.scale.x', getProperty('iconP2.scale.x') - speed)
	setProperty('iconP2.scale.y', getProperty('iconP2.scale.y') -  speed)
	end
	
	if getProperty('iconP1.scale.x') <= bfScale or getProperty('iconP1.scale.y') <= bfScale then
	fix1 = false
	end
	if getProperty('iconP2.scale.x') <= 1 or getProperty('iconP2.scale.y') <= 1 then
	fix2 = false
	end
	
	if fix1 == false then
	setProperty('iconP1.scale.x',bfScale)
	setProperty('iconP1.scale.y',bfScale)
	end
	
	if fix2 == false then
	setProperty('iconP2.scale.x',1)
	setProperty('iconP2.scale.y',1)
	end
	end
	
	function onUpdatePost()
	if getProperty('iconP1.scale.x') <= bfScale or getProperty('iconP1.scale.y') <= bfScale then
	fix1 = false
	end
	if getProperty('iconP2.scale.x') <= 1 or getProperty('iconP2.scale.y') <= 1 then
	fix2 = false
	end
	
	if fix1 == false then
	setProperty('iconP1.scale.x',bfScale)
	setProperty('iconP1.scale.y',bfScale)
	end
	
	if fix2 == false then
	setProperty('iconP2.scale.x',1)
	setProperty('iconP2.scale.y',1)
	end
	end
	
	function onTimerCompleted(tag)
	if tag == 'fix1' then
	fix1 = false
	end
	if tag == 'fix2' then
	fix2 = false
	end
	
	
	end


	