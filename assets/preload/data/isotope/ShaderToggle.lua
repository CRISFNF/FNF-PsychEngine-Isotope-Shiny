
OpenMenu = true


function onUpdate()

    if OpenMenu and songName == "Isotope"then
        OpenMenu = false
        openCustomSubstate('Pause', true)
    end
end

function onCustomSubstateUpdate(tag)
    if tag == "Pause" then
      makeLuaText('CustomPauseMenu', [[

This song has shaders. 
Do you want to enable them?
(May cause lag on lower end devices)
        
Press Enter To enable

Press N to disable

Press Back To Exit
        
        ]], 1100, 0, 200)
      setTextSize('CustomPauseMenu', 32)
      screenCenter('CustomPauseMenu', 'x')
      addLuaText('CustomPauseMenu')

      makeLuaSprite('Background', nil, 0, 0)
      makeGraphic('Background', 2000, 2000, '000000')
      setProperty('Background.alpha', 0.3)
      setProperty('camHUD.alpha', 0)
      screenCenter('Background', 'x')
      screenCenter('Background', 'y')
      setObjectCamera('Background', 'camGame')
      setObjectCamera('CustomPauseMenu', 'camGame')
     addLuaSprite('Background', true)
    end

if keyJustPressed('accept') then
    openMenu = false
    closeCustomSubstate()
    setProperty('camHUD.alpha', 1)
    removeLuaText('CustomPauseMenu')
    removeLuaSprite('Background')

--restart thing
elseif keyboardPressed('N') then
    openMenu = false
    closeCustomSubstate()
    setProperty('camHUD.alpha', 1)
    removeLuaText('CustomPauseMenu')
    removeLuaSprite('Background')

--exit thing
elseif keyJustPressed('back') then
    exitSong()
end
end
