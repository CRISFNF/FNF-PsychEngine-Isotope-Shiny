textarray = {Purin = "do NOT put your dick in those holes", Purinextra = "Why is my dick whispering demonic things to me now?", Isotope = "we forgot to scrap it", Isotopeextra = "You didn't forget to scrap the whole mod"}

function onCreatePost()
    if difficulty == 0 then
        theMessage = textarray[songName]
    elseif difficulty == 1 then
        theMessage = textarray[songName..'extra']
    end
    makeLuaText('botmessage', theMessage, 1280, 0, 0)
    setTextAlignment('botmessage', 'CENTER')
    setTextBorder("botmessage", 1.5, '000000')
    setObjectCamera('botmessage', 'hud')
    setTextSize('botmessage', 30)
end

function onUpdatePost()
    if botPlay then
        addLuaText('botmessage')
    end
    setProperty('botmessage.y', getProperty('botplayTxt.y') + 30)
    setProperty('botmessage.alpha', getProperty('botplayTxt.alpha'))
end