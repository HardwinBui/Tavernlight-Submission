-- constant variables added for readabiliy
local STORAGE_ID = 1000
local RELEASE_TIME = 1000

local function releaseStorage(player)
    player:setStorageValue(STORAGE_ID, -1)
end
    
function onLogout(player)
    if player:getStorageValue(STORAGE_ID) == 1 then
        addEvent(releaseStorage, RELEASE_TIME, player)
        -- return false assuming we want to inform scripts that storage hasnt been released
        return false 
    end
    return true
end