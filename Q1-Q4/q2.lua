-- Changed code to print out each guild that meets the requirement

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectQueryString = "SELECT name FROM guilds WHERE max_members < %d;" -- for improved readability
    local selectGuildQuery = string.format(selectQueryString, memberCount)
    local resultId = db.storeQuery(selectGuildQuery)
    -- make sure guild was fetched
    if not resultId then
        print("Failed to find guilds")
        return
    end

    -- print all guilds that are small enough
    print("Guilds with less that " .. memberCount .. " members:")
    repeat
        local guildName = resultId.getString("name")
        print(guildName)
    until not resultId.next()
    
end

