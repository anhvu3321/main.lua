-- local function base64Encode(data)
--     local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
--     return ((data:gsub('.', function(x)
--         local r, b = '', x:byte()
--         for i = 8, 1, -1 do
--             r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
--         end
--         return r
--     end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
--         if (#x < 6) then
--             return ''
--         end
--         local c = 0
--         for i = 1, 6 do
--             c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0)
--         end
--         return b64chars:sub(c + 1, c + 1)
--     end) .. ({ '', '==', '=' })[#data % 3 + 1])
-- end
print(1)
local function base64Encode(data)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local result = ""

    for i = 1, #data, 3 do
        local chunk = data:sub(i, i + 2)
        local byte1, byte2, byte3 = chunk:byte(1, 3) or 0, chunk:byte(2, 3) or 0, chunk:byte(3, 3) or 0

        local bits = string.format('%08d%08d%08d', 
            tonumber(string.format('%08d', byte1):reverse(), 2),
            tonumber(string.format('%08d', byte2):reverse(), 2),
            tonumber(string.format('%08d', byte3):reverse(), 2)
        )

        for j = 1, 4 do
            local index = tonumber(bits:sub((j - 1) * 6 + 1, j * 6), 2) + 1
            result = result .. (index <= 64 and b64chars:sub(index, index) or '=')
        end
    end

    return result
end
local function encode(string)
    string = base64Encode(string)
    local result = ""
    for i = 1, #string do
        local char = string.sub(string, i, i)
        result = result .. string.char(string.byte(char) + 1)
    end
    return result
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
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= nil and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") ~= "1" then
            local a = nil
            -- repeat task.wait(0.01)
                local request = request or fluxus and fluxus_request or http.request

                local code = 'Verudous'
                local type = 'haki'
                local time = tostring(os.time())
                
                local list = {code, type, time}
                
                shuffle(list)
                
                local embed = {
                    title = "Haki Color Notifier | Xero Hub",
                    type = "rich",
                    color = 3447003,
                    fields = {
                        {name = "Haki Color Name", value = '```' .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")) .. '```', inline = true},
                        {name = "Player Count", value = '```' .. tostring(game:GetService("Players").NumPlayers) .. '```', inline = true},
                        {name = "Job Id", value = '```' .. game.JobId .. '```', inline = false},
                        {name = "Join Code", value = '```lua\n' .. 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', ' .. '"' ..  game.JobId .. '"' .. ', game:GetService("Players").LocalPlayer)' .. '```', inline = false}
                    },
                    footer = {text = 'https://discord.gg/FdyuDrRp99'},
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time())
                }

                local payload = {
                    embeds = {embed}
                }

                local HttpService = game:GetService("HttpService")
                local key = table.concat(list)
                
                key = encode(key)
                print(key)
                local data = {
                    key = key,
                    payload = encode(HttpService:JSONEncode(payload))
                }

                a = request({
                    Url = 'https://apixerohub.000webhostapp.com/',
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = HttpService:JSONEncode(data)
                })
                print(HttpService:JSONEncode(data))
            -- until a and tostring(a["Body"]) ~= "Invalid Key!"
            repeat task.wait(1) until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") == nil
        end
    end
end
spawn(HakiColorNotify)
