twoBeat = false
bordersSize = 90
function onStepHit()

if (curStep > 255 and curStep % 4 == 0 and curStep < 492) or (curStep > 1088 and curStep % 4 == 0 and curStep < 1280) or (curStep > 2146 and curStep % 4 ==0 and curStep< 2400) or (curStep > 2463 and curStep % 4 ==0 and curStep < 2656) then--(curStep > 1279 and curStep % 4 == 0 and curStep < 1392) or (curStep > 1407 and curStep % 4 == 0 and curStep < 1664) or (curStep > 2464 and curStep % 4 == 0 and curStep < 2968) or (curStep > 3104 and curStep % 4 == 0 and curStep < 3348) then
if not twoBeat then
triggerEvent('Add Camera Zoom','0.03','0.06')
twoBeat = true
elseif twoBeat then
triggerEvent('Add Camera Zoom','0.045','0.09')
twoBeat = false
end
end

end

function onBeatHit()
if (curBeat > 0 and curBeat % 2 ==0 and curBeat < 64) or (curBeat > 128 and curBeat % 2 ==0 and curBeat < 272) or (curBeat > 324 and curBeat % 2 ==0 and curBeat < 392) or (curBeat > 456 and curBeat % 2 ==0 and curBeat < 520) then
if not twoBeat then
triggerEvent('Add Camera Zoom','0.03','0.06')
twoBeat = true
elseif twoBeat then
triggerEvent('Add Camera Zoom','0.045','0.09')
twoBeat = false
end
end

end


function onUpdate()
end

function onSongStart()

            end