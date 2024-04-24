-- Improved readability by changing the function names and adding local variables

function removeMemberFromPlayerParty(playerId, membername)
    player = Player(playerId)
    -- make sure player exists
    if not player then
        return
    end

    local party = player:getParty()
    -- seperate variable for better readability
    local members = party:getMembers() 

    -- remove k for better readability
    for _,v in pairs(members) do 
        -- end the function assuming that the same member doesnt appear twice in a party
        if v == Player(membername) then
            party:removeMember(Player(membername))
            return 
        end
    end
end