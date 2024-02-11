local function HopLowServer(max_players, page)
    local placeid = game.PlaceId
    local next_page = ""
    local servers = nil
    if next_page == "" then
        servers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeid .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        servers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeid .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. next_page))
    end
    next_page = servers.nextPageCursor
    local check = false
    for _, value in pairs(servers.data) do
        if value.maxPlayers > value.playing and max_players >= value.playing then
            check = true
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeid, value.id, game:GetService("Players").LocalPlayer)
            task.wait(1)
        end
    end
    if not check and next_page and next_page ~= "" and next_page ~= nil then
        HopLowServer(max_players, next_page)
    elseif not check or not next_page or next_page == "" or next_page == nil then
        HopLowServer(max_players)
    end
end
if tonumber(game:GetService("Lighting"):GetAttribute("MoonPhase")) ~= 5 or game:GetService("Lighting").ClockTime > 15 then
    HopLowServer(10)
end
