getgenv().Setting = {
    ["Team"] = "Pirates", --[[Marines]]
    ["Webhook"] = {
        ["Url"] = "https://discord.com/api/webhooks/1188714179008401489/gFxzOQaDW18DB5Bs6dCeaBL0NBbshejEkNmTC4Govmj5H52Mrs62Zkp9zRWXetrQ3zJu", --[[ link webhook]]
        ["Enabled"] = true, --[[ enable webhook]]
    },
    ["BypassTP"] = {
        ["Enable"] = true, --[[ bypass tp ]]
        ["Attempt"] = 0, --[[ Tween If Failed After x Attempts (change to 0 for inf bypass tp even it fail)]]
    },
    ["FpsLock"] = {
        ["Enable"] = true, --[[ lock fps]]
        ["Cap"] = 30, --[[ fps to lock]]
    },
    ["LockBounty"] = {
        ["Enable"] = true, --[[ lock bounty]]
        ["Cap"] = 30000000, --[[ reach to this bounty do the action below]]
        ["Action"] = "Kick", --[[ Kick, Shutdown]]
        ["SendMessage"] = true, --[[ send message to webhook when reach the cap]]
        ["Message"] = "Congratulation You Have Reached The Bounty Cap MyBounty" --[[ It Will Replace MyBounty With Your Current Bounty, Add Ping Everyone If You Want]]
    },
    ["Click"] = {
        ["Enable"] = true, --[[ click ]]
        ["FastClick"] = true --[[ fast click]]
    },
    ["Haki Ken"] = {
        ["Enable"] = true, --[[ Ken Haki ]]
    },
    ["SpamSkill"] = true, --[[ Will use all skills as fast as possbile ignore holding skills]]
    ["Weapons"] = { --[[ Select Weapon, Self Explain]]
        ["Melee"] = {
            ["Enable"] = true, --[[ enable using melee]]
            ["Delay"] = 1,   --[[ time delay between the melee skill]] 
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, --[[ enable using skill Z]]
                    ["HoldTime"] = 0,  --[[ hold skill in (seconds)]]
                },
                ["X"] = {
                    ["Enable"] = true, --[[ enable using skill X ]]
                    ["HoldTime"] = 1,  --[[ hold skill in (seconds)]]
                },

                ["C"] = {
                    ["Enable"] = true, --[[ enable using skill C]]
                    ["HoldTime"] = 1,  --[[ hold skill in (seconds)]]
                },
            },
        },
        ["Blox Fruit"] = {
            ["Enable"] = true, --[[ enable using blox fruit]]
            ["Delay"] = 1,  --[[ time delay between the blox fruit skill ]]
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, --[[ enable using skill Z]]
                    ["HoldTime"] = 0, --[[ hold skill in (seconds)]]
                },
                ["X"] = {
                    ["Enable"] = true, --[[ enable using skill X]]
                    ["HoldTime"] = 0, --[[ hold skill in (seconds)]]
                },

                ["C"] = {
                    ["Enable"] = true, --[[ enable using skill C]]
                    ["HoldTime"] = 1, --[[ hold skill in (seconds)]]
                },
                ["V"] = {
                    ["Enable"] = true, --[[ enable using skill V]]
                    ["HoldTime"] = 3, --[[ hold skill in (seconds)]]
                },
                ["F"] = {
                    ["Enable"] = true, --[[ enable using skill F]]
                    ["HoldTime"] = 0, --[[ hold skill in (seconds)]]
                },
            },
        },
        ["Sword"] = {
            ["Enable"] = true, --[[ enable using sword]]
            ["Delay"] = 1, --[[ time delay between the sword skill ]]
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true, --[[ enable using skill Z]]
                    ["HoldTime"] = 0, --[[ hold skill in (seconds)]]
                },
                ["X"] = {
                    ["Enable"] = true, --[[[[enable using skill X]]
                    ["HoldTime"] = 0, --[[ hold skill in (seconds)]]
                },
            },
        },
    }
}
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Xero2409/XeroHub/main/bounty.lua")))()
