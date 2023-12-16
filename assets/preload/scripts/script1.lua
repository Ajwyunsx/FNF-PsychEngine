function onTimerCompleted(tag)
if tag =='backFreePlay' then
loadSong('FREEPLAY')
end
end
wait = true

function onEndSong()
if wait then
wait = false
runTimer('backFreePlay',1)
return Function_Stop
    end
    if wait == false then
        return Function_Continue
    end
end