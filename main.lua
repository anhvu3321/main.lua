print(1)
local request = request or fluxus and fluxus_request or http.request
local a = request({
    Url = "https://xerobestfrihub.000webhostapp.com/cnt.php",
    Method = "POST",
    Header ={
       ["Contest-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode(args)
})
local checked = false
local numcnt
for i,v in pairs(a) do 
    numcnt = v
end
local function Log()
    local request = request or fluxus and fluxus_request or http.request
    local url = "https://discord.com/api/webhooks/1191345813243318402/AsBv_h5uzRfxTsXqhM0WR9ICw1ee23JGV3GYCKuphumOTTzW6icW5nnujDyEDb62qGnO"
    local embed = {
        title = "Xero Hub Auto Bounty: ",
        color = 65280, 
        fields = {
            {name = "Count" , value = "
```" .. numcnt .. "```
", inline = true},
            {name = "Username", value = "```
" .. game:GetService("Players").LocalPlayer.Name .. "```
", inline = true},
        }
    }
    local payload = {
        embeds = {embed}
    }
    request{
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(payload)
    }
end
Log()
