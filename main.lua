print('executed')
-- Notify functions
local function encode(string)
    local result = ""

    -- Ceaser Cipher
    for i = 1, string.len(string) do
        local char = string.sub(string, i, i)

        if char:match("%w") then
            if char:match("%a") then
                local base = string.byte('a')
                if char:match("%u") then
                    base = string.byte('A')
                end
                result = result .. string.char((string.byte(char) - base + 1) % 26 + base)
            elseif char:match("%d") then
                result = result .. string.char((string.byte(char) - string.byte('0') + 3) % 10 + string.byte('0'))
            end
        else
            result = result .. char
        end
    end

    -- Hex
    local final_result = ""
    for i = 1, #result do
        final_result = final_result .. string.format("%02x", result:byte(i))
    end

    -- Ascii
    local perfect = ""
    for i = 1, string.len(final_result) do
        local char = string.sub(final_result, i, i)
        perfect = perfect .. string.char(string.byte(char) + 5)
    end

    return perfect
end
local function shuffle(tbl)
    local rand = math.random
    local n = #tbl

    while n > 2 do
        local k = rand(n)
        tbl[n], tbl[k] = tbl[k], tbl[n]
        n = n - 1
    end
end
local function HakiColorNotify()
    while task.wait(1) do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= nil and tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")) ~= "1" then
            local request = request or fluxus and fluxus_request or http.request

            local code = 'Verudous'
            local type = 'haki'
            local time = tostring(os.time())
            local list = {code, type, time}
            shuffle(list)
            local key = table.concat(list)
                
            local embed = {
                title = "Haki Color Notifier | Xero Hub",
                type = "rich",
                color = 3447003,
                fields = {
                    {name = "Haki Color Name", value = '```' .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")) .. '```', inline = true},
                    {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = true},
                    {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                    {name = "Join Script", value = '```' .. "lua\n" .. 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', ' .. '"' ..  game.JobId .. '"' .. ', game:GetService("Players").LocalPlayer)' .. '```', inline = false}
                },
                footer = {text = 'https://discord.gg/FdyuDrRp99'},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
            }

            local payload = {
                embeds = {embed}
            }
            print('```' .. "lua\n" .. 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', ' .. '"' ..  game.JobId .. '"' .. ', game:GetService("Players").LocalPlayer)' .. '```')
            local HttpService = game:GetService("HttpService")

            local data = {
                key = encode(key),
                payload = encode(HttpService:JSONEncode(payload))
            }
            
            local a = nil
            repeat task.wait(0.01)
                a = request({
                        Url = 'https://apixerohub.000webhostapp.com/',
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = HttpService:JSONEncode(data)
                    })
            until a and tostring(a["Body"]) ~= "Expired!"
            repeat task.wait(1) until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") == nil
        end
    end
end
task.spawn(HakiColorNotify)
