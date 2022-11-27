local shaderName = "vignetteGlitch"

function onCustomSubstateUpdate(tag)
    if tag == "Pause" then
        if keyJustPressed('accept') then
            shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

            makeLuaSprite("tempShader0")
            runHaxeCode([[
                var shaderName = "]] .. shaderName .. [[";
                
                game.initLuaShader(shaderName, 130);
                
                var shader0 = game.createRuntimeShader(shaderName);
                game.camGame.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
                return;
            ]])
        elseif keyboardPressed('N') then
            shader = false
        end
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

function onUpdatePost()
    if curStep >= 1104 then
        setShaderFloat('tempShader0', 'time', getSongPosition() / (stepCrochet * 16))
        setShaderFloat('tempShader0', 'prob', 0.75)
        setShaderFloat('tempShader0', 'intensity', 0.5)
    end
end