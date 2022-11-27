local foreverLetters = {'S+', 'S', 'A', 'B', 'C', 'D', 'E', 'F'}
local foreverPercents = {100, 95, 90, 85, 80, 75, 70, 65}
local foreverRating = 'N/A'

local foreverHealth = true

local infoX = 515

if miniTimeTxt then
  infoX = 405
end

function onCreatePost()

  -- hide original psych ui
  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)

  -- setup forever ui
  makeLuaText('foreverScore', 'Score: 0 • Accuracy: 0% • Combo Breaks: 0 • Rank: N/A', 1280, 0, (downscroll and 114 or 680));
  setTextBorder("foreverScore", 1.5, '000000')
  setTextAlignment('foreverScore', 'CENTER')
  setTextSize('foreverScore', 18)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverScore') end

  makeLuaText('foreverCenterMark', ' - ' .. songName .. ' [' .. string.upper(difficultyName) .. ((miniTimeTxt and getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled') and ' - 00:00 / ' .. milliToHuman(math.floor(songLength)) .. '] -' or '] -'), 0, infoX, (downscroll and 678 or 22))
  setTextAlignment('foreverCenterMark', 'CENTER')
  setTextBorder("foreverCenterMark", 2, '000000')
  setTextSize('foreverCenterMark', 24)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverCenterMark') end
  
  makeLuaText('foreverCornerMark', (fakeForever and 'FOREVER ENGINE v0.3.1' or 'FOREVER ENGINE v' .. version), 1275, 0, 5)
  setTextAlignment('foreverCornerMark', 'RIGHT')
  setTextBorder("foreverCornerMark", 2, '000000')
  setTextSize('foreverCornerMark', 18)
  if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverCornerMark') end
end

function onUpdate()
  if miniTimeTxt and getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled' and curStep > 0 then
    setTextString('foreverCenterMark', ' - ' .. songName .. ' [' .. string.upper(difficultyName) .. ' - ' .. milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)) .. ' / ' .. milliToHuman(math.floor(songLength)) .. '] -')
  end
end

function onRecalculateRating()
  reloadRating(round((getProperty('ratingPercent') * 100), 2))
  setTextString('foreverScore',
  'Score: '..score.. -- setup score
  ' • Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'.. --setup accuracy
  (((hits > 0) or (songMisses > 0)) and ' [' .. (not botPlay and ratingFC or 'N/A') .. ']' or '').. -- figure out fc
  ' • Combo Breaks: '..misses.. -- misses (easy)
  ' • Rank: '..foreverRating) -- rating (dumb)
end

function reloadRating(percent)
  -- figures out your rating
  for i = 1,#foreverLetters do
    if foreverPercents[i] <= percent then
      foreverRating = foreverLetters[i]
      break
    end
  end
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end