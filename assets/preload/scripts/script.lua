
function onCreate()
	makeLuaSprite('videoSprite','',-300,-180)
	scaleObject('videoSprite',0.7,0.7)
	addLuaSprite('videoSprite')
	setProperty('videoSprite.visible',false)
setObjectCamera('videoSprite', 'camOther');
	addHaxeLibrary('MP4Handler','vlc')
	addHaxeLibrary('Event','openfl.events')
end

function onUpdatePost()

	runHaxeCode([[
		var video = getVar('video');
		game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
		video.volume = FlxG.sound.volume + 100;	
		if(game.paused)video.pause();
	]])
end
	
	function onTimerCompleted(tag)
	if tag == 'endcutsen' then
doTweenAlpha('end','videoSprite',0,0.5)
for i =0,7 do 
	noteTweenAlpha(i,i,1,0.5)
	end
	zoom = true
   end
   end
function onStepHit()
if curStep <=5 then
--setProperty("debugKeysChart", null)
if getPropertyFromClass('PlayState', 'chartingMode') == true then
--if getPropertyClass('backend.ClientPrefs', 'chartingMode') == true then
doTweenZoom('GameZoom','camGame',2.5,8,'linear')
doTweenAlpha('GameAlpha','camGame',0,8,'linear')
CHEAT = true
runTimer('YOUCHEAT',8)
runTimer('kickOutGame',32)
return Function_Stop
end
end
end

function onUpdate()
if CHEAT then
setProperty('playbackRate',getProperty('playbackRate')- 3/1000)
end
end

function onTimerCompleted(tag)
if tag == 'YOUCHEAT' then
setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
setProperty('videoSprite.visible',true)
runHaxeCode([[
		var filepath = Paths.video('Cheating_is_a_sin');		
		var video = new MP4Handler();
		video.playVideo(filepath);
		video.visible = false;
		setVar('video',video);
		FlxG.stage.removeEventListener('enterFrame', video.update); 
	]])
	playSound('Cheating_is_a_sin')
end

if tag == 'kickOutGame' then
exitSong()
end
end

function onPause()
    if CHEAT then
        return Function_Stop
    end
end
