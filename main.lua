local function base64Encode(data)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do
            r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
        end
        return r
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then
            return ''
        end
        local c = 0
        for i = 1, 6 do
            c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0)
        end
        return b64chars:sub(c + 1, c + 1)
    end) .. ({ '', '==', '=' })[#data % 3 + 1])
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

local code = 'Verudous'
local type = 'haki'
local time = tostring(os.time())

local HttpService = game:GetService("HttpService")
local key = code .. time .. type
key = encode(key)

local embed = {
    title = "Haki Notifier",
    type = "rich",
    color = 3447003,
    fields = {
        {name = "Haki Name", value = "```Pure Red```", inline = true}
    }
}

local payload = {
    embeds = {embed}
}

local data = {
    key = key,
    payload = encode(HttpService:JSONEncode(payload))
}

local request = request or fluxus and fluxus_request or http.request

local a = request({
    Url = 'https://apixerohub.000webhostapp.com/',
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(data)
})
print(a["Body"])
