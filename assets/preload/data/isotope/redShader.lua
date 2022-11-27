function onCustomSubstateUpdate(tag)
    if tag == "Pause" then
        if keyJustPressed('accept') then
            shader = true
        elseif keyboardPressed('N') then
            shader = false
        end
    end
end

function onCreatePost()
    initLuaShader('redAberration')
end

function onStepHit()
    if curStep == 1104 and shader then --1104
        setSpriteShader('dad', 'redAberration')
    end
end

function onBeatHit()
    if curStep >= 1104 and curBeat % 4 == 0 then --1104
        setShaderFloat('dad', 'time', os.clock())
        setShaderFloat('dad', 'intensity', 2)
        setShaderFloat('dad', 'initial', 0.5)
    else
        setShaderFloat('dad', 'intensity', 0)
        setShaderFloat('dad', 'initial', 0)
    end
end