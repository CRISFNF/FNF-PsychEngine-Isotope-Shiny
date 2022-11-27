function onCreate()
	-- background shit
	makeLuaSprite('glitch_City', 'glitch_City', -600, -300)
	setScrollFactor('glitch_City', 0.9, 0.9)
	
	makeLuaSprite('tiles', 'tiles', -600, -300)
	setScrollFactor('tiles', 0.9, 0.9)
	scaleObject('tiles', 1.1, 1.1)
	
	makeAnimatedLuaSprite('FUCKKKKK', 'FUCKKKKK', 1770, 1350); 
    addAnimationByPrefix('FUCKKKKK', 'FUCKKKKK', 'Lmao', 24, true);
	scaleObject('FUCKKKKK', 1.6, 1.6)
	setObjectOrder("FUCKKKKK", 2)
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

		makeLuaSprite('haze', 'haze', -500, -300)
		setScrollFactor('haze', 1.0, 1.0)
		scaleObject('haze', 0.9, 0.9)
		setObjectOrder("haze", 1)
	
	end

	addLuaSprite('glitch_City', false)
	addLuaSprite('tiles', false)
	addLuaSprite('stagelight_left', false)
	addLuaSprite('stagelight_right', false)
	addLuaSprite('haze', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end