cutscene = false
num = null

function onCreate()
	if difficulty == 0 then
		num = 0.9
	else 
		num = 0.8
	end
	setProperty('camZooming', false)
    setProperty('skipCountdown', true)

	makeLuaSprite('gcity', 'stages/glitchy/images/glitch_City', -1320, -725)
	setScrollFactor('gcity', 0.8, 0.8)
	scaleObject('gcity', 1 * 0.625, 1 * 0.625);

	makeLuaSprite('tiles', 'stages/glitchy/images/tiles', -1400, -725)
	setScrollFactor('tiles', 0.9, 0.9)
	scaleObject('tiles', 1 * 0.625, 1 * 0.625);

	makeLuaSprite('haze', 'stages/glitchy/images/haze', -1400, -725)
	setScrollFactor('haze', 0.9, 0.9)
	scaleObject('haze', 1 * 0.625, 1 * 0.625);

	makeLuaSprite('blackhud', 'stages/pokecenter/images/black', -1400, -725)
	scaleObject('blackhud', 10, 10)
	setProperty('blackhud.alpha', 0)
	setScrollFactor('blackhud', 0, 0);

	makeAnimatedLuaSprite('girlTits', 'stages/glitchy/images/FUCKKKKK', -200, 140)
    addAnimationByPrefix('girlTits', 'idle', 'Lmao', 24, true);

	makeAnimatedLuaSprite('throwball', 'stages/glitchy/images/IsotopeBF', -1200, 50)
    addAnimationByPrefix('throwball', 'idle', 'Bf pokeball throw instance', 24, false);
	setProperty('throwball.visible', false)

	makeAnimatedLuaSprite('legacyCutscene', 'stages/glitchy/images/they_took_everything_from_me', 180, -300)
	addAnimationByPrefix('legacyCutscene', 'speak', 'GlitchySpeak', 24, false)
	scaleObject('legacyCutscene', 0.85, 0.85)
	setProperty('legacyCutscene.visible', false)
	setProperty('legacyCutscene.alpha', 0.01)
	legx = getProperty('legacyCutscene.x'); -- Idk
	precacheImage('stages/glitchy/images/they_took_everything_from_me')

	addLuaSprite('gcity');
	addLuaSprite('tiles');
	addLuaSprite('haze');
	addLuaSprite('girlTits');
	addLuaSprite('throwball', true);
	addLuaSprite('blackhud', true);
	addLuaSprite('legacyCutscene');
end

function onCreatePost()
	setProperty('foreverScore.visible', false);
	setProperty('foreverCenterMark.visible', false);
	setProperty('foreverCornerMark.visible', false);
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.alpha', 0);
end

function onSectionHit() -- For cutscene do 1.50
	if not cutscene then
		if mustHitSection then
			setProperty('defaultCamZoom', 0.70)
		else
			setProperty('defaultCamZoom', 0.85) -- normal is 0.85
		end
	end
end

function onBeatHit()
	if curBeat >= 31 then
		setProperty('camZooming', true)
	end
	objectPlayAnimation('girlTits', 'idle', true);
end

function onStepHit()

	if curStep == 255 then
		setProperty('foreverScore.visible', true);
		setProperty('foreverCenterMark.visible', true);
		setProperty('foreverCornerMark.visible', true);
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('healthBar.alpha', 1);
		setProperty('camHUD.alpha', 1)
	end
	if difficulty == 1 then
		if curStep == 1066 then
			objectPlayAnimation('throwball', 'idle', true);
			setProperty('boyfriend.visible', false)
			setProperty('throwball.visible', true)
		elseif curStep == 1086 then
			setProperty('setlyric.x', getProperty('setlyric.x') + 190)
			setTextString('sunglyric','No.')
		elseif curStep == 1098 then
			setProperty('setlyric.x', getProperty('setlyric.x') - 190)
			setTextString('sunglyric',' ')
		elseif curStep == 1104 then
			setProperty('boyfriend.visible', true)
			setProperty('throwball.visible', false)
		end

		if curStep == 234 then -- am I a joke to you?
			setProperty('setlyric.x', getProperty('setlyric.x') + 70)
			setTextString('setlyric','      I a joke to you?')
			setTextString('sunglyric','Am')
		elseif curStep == 237 then
			setTextString('setlyric','Am    a joke to you?')
			setTextString('sunglyric','      I')
		elseif curStep == 239 then
			setTextString('setlyric','Am I    joke to you?')
			setTextString('sunglyric','         a')
		elseif curStep == 242 then
			setTextString('setlyric','Am I a          to you?')
			setTextString('sunglyric','            joke')
		elseif curStep == 245 then
			setTextString('setlyric','Am I a joke      you?')
			setTextString('sunglyric','                     to')
		elseif curStep == 248 then
			setTextString('setlyric','Am I a joke to')
			setTextString('sunglyric','                           you?')
		elseif curStep == 258 then
			setProperty('setlyric.x', getProperty('setlyric.x') - 70)
			setTextString('setlyric',' ')
			setTextString('sunglyric',' ')
		end
	end
	if curStep == 1872 then
		-- They
		setTextString('setlyric', '          took everything from me...')
		setTextString('sunglyric','They')
		-- Cutscene on!
		cutscene = true
		-- No more Forever Engine! No More GUI! No more $19 forever engine gui!!
		setProperty('foreverScore.visible', false);
		setProperty('foreverCenterMark.visible', false);
		setProperty('foreverCornerMark.visible', false);
		-- Rip HealthBar
		setProperty('healthBar.alpha', 0);
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
		-- Hiding the HUD
		setProperty('blackhud.alpha', 1);
		setProperty('defaultCamZoom', 1.50);
		-- Rip the players
		setProperty('dad.visible', false);
		setProperty('boyfriend.visible', false);
		setProperty('girlTits.visible', false);
		-- Him
		setProperty('legacyCutscene.visible', true);
		-- Timers ig
		runTimer('strummy', 1); -- The notes fading
		runTimer('The Cutscene', 0.4); -- The Cutscene
		objectPlayAnimation('legacyCutscene', 'speak', true)
	end
	-- Lyrics
	if curStep == 1875 then -- took
		setTextString('setlyric', 'They            everything from me...')
		setTextString('sunglyric','          took')
	elseif curStep == 1879 then -- everything
		setTextString('setlyric', 'They took                      from me...')
		setTextString('sunglyric','                    everything')
	elseif curStep == 1885 then -- from
		setTextString('setlyric', 'They took everything            me...')
		setTextString('sunglyric','                                        from')
	elseif curStep == 1888 then -- me...
		setTextString('setlyric', 'They took everything from')
		setTextString('sunglyric','                                                  me...')
	end

	if curStep == 1895 then -- My VOICE,
		setProperty('setlyric.x', getProperty('setlyric.x') + 150)
		setTextString('setlyric', '      VOICE,')
		setTextString('sunglyric','My')
	elseif curStep == 1900 then
		setTextString('setlyric', 'My')
		setTextString('sunglyric','      VOICE,')
	end

	if curStep == 1912 then -- My FREEDOM,
		setTextString('setlyric', '      FREEDOM,')
		setTextString('sunglyric','My')
	elseif curStep == 1918 then
		setTextString('setlyric', 'My')
		setTextString('sunglyric','      FREEDOM,')
	end

	if curStep == 1932 then -- My LEGACY,
		setTextString('setlyric', '      LEGACY,')
		setTextString('sunglyric','My')
	elseif curStep == 1938 then
		setTextString('setlyric', 'My')
		setTextString('sunglyric','      LEGACY,')
	end

	if curStep == 1952 then -- And they replaced me with some
		setProperty('setlyric.x', getProperty('setlyric.x') - 150)
		setTextString('setlyric', '        they replaced me with some')
		setTextString('sunglyric','And')
	elseif curStep == 1955 then
		setTextString('setlyric', 'And           replaced me with some')
		setTextString('sunglyric','        they')
	elseif curStep == 1957 then
		setTextString('setlyric', 'And they                   me with some')
		setTextString('sunglyric','                 replaced')
	elseif curStep == 1963 then
		setTextString('setlyric', 'And they replaced       with some')
		setTextString('sunglyric','                                  me')
	elseif curStep == 1965 then
		setTextString('setlyric', 'And they replaced me          some')
		setTextString('sunglyric','                                        with')
	elseif curStep == 1969 then
		setTextString('setlyric', 'And they replaced me with')
		setTextString('sunglyric','                                                some')
	end

	if curStep == 1978 then -- blue... haired... KID.
		setProperty('setlyric.x', getProperty('setlyric.x') + 150)
		setTextString('setlyric', ' ')
		setTextString('sunglyric','blue...')
	elseif curStep == 1984 then -- literally 1984
		setTextString('setlyric', ' ')
		setTextString('sunglyric','haired...')
	elseif curStep == 1991 then
		setProperty('setlyric.x', getProperty('setlyric.x') + 20)
		setTextString('setlyric', ' ')
		setTextString('sunglyric','KID.')
	elseif curStep == 2000 then
		setTextString('setlyric', ' ')
		setTextString('sunglyric',' ')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'strummy' then
		for i = 4,8 do
			noteTweenAlpha('Noters'..i, i, 0, 3, 'quadInOut')
		end
	end
	if tag == 'The Cutscene' then
		setObjectOrder('legacyCutscene', 11)
		doTweenAlpha('Blacken', 'blackhud', 0.5, 1.6, 'quadInOut')
		--setProperty('legacyCutscene.x', legx - 300)
		doTweenX('Mover', 'legacyCutscene', legx - 150, 9.0, 'quadInOut')
		doTweenAlpha('TheRedAppears', 'legacyCutscene', 1, 9.0, 'quadInOut')	
	end
	if tag == 'lol' then
		setProperty('blackhud.alpha', 1)
		setProperty('defaultCamZoom', 0.7);
		setProperty('legacyCutscene.visible', false)
		setProperty('dad.visible', true);
		setProperty('boyfriend.visible', true);
		if difficulty == 1 then
			setProperty('girlTits.visible', true);
		end
		runTimer('bruh', 0.5)
	end
	if tag == 'bruh' then
		for i = 4,8 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', num)
		end
		setProperty('foreverScore.visible', true);
		setProperty('foreverCenterMark.visible', true);
		setProperty('foreverCornerMark.visible', true);
		setProperty('healthBar.alpha', 1);
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
		setProperty('blackhud.alpha', 0);
	end
end

function onTweenCompleted(tag)
	if tag == ('Mover') then
		runTimer('lol', 0.5)
		cutscene = false
	end
end