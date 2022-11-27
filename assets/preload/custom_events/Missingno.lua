local defaultNotePos = {};
local spin = false;
local arrowMoveX = 0;
local arrowMoveY = 0;

function onStartCountdown()
setProperty('dad.alpha', 0) 
end

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
    end
end

function onEvent(name,value1,value2)
if difficulty == 1 or difficulty == 2 then
if name == 'Missingno' then 	
    noteTweenAlpha("note yeah", 0, 0, 1, "linear")
    noteTweenAlpha("lelelele", 1, 0, 1, "linear")
    noteTweenAlpha("mmmm", 2, 0, 1, "linear")
    noteTweenAlpha("waaaaaaa", 3, 0, 1, "linear")
		for i = 4,7 do 
			setPropertyFromGroup('strumLineNotes', i, 'x', 
			defaultNotePos[i + 1][1] + math.floor(math.random(-500,160)))
	
			if downscroll == true then 
				ylowest = 50;
				yhighest = -150;
			else 
				ylowest = -100
				yhighest = 540;
			end
	
			setPropertyFromGroup('strumLineNotes', i, 'y', 
			defaultNotePos[i + 1][2] + math.floor(math.random(ylowest,yhighest)))
		end
	end
end	
if name == 'Play Animation' then	
if value1 == 'intro' then	
doTweenAlpha('camHUD', 'camHUD', 1, 1, 'linear')	
setProperty('dad.alpha', 1)		
end	
end
end