if Setting then return end

getgenv().Setting = {
    ["Hunt"] = {
        ["Team"] = "Marines"
    },
    ["Webhook"] = {
        ["Enable"] = false,
        ["Url"] = ""
    },
    ["Skip"] = {
        ["V4"] = true,
        ["Fruit"] = {
            "Portal-Portal",
            "Mammoth-Mammoth",
            "Buddha-Buddha"
        },
        ["Near-Island Max Distance"] = 7000
    },
    ["Chat"] = {
        ["Enable"] = true,
        ["Content"] = "ez, gg, gggggg"
    },
    ["Misc"] = {
        ["Hold Until Max Skill Preserve"] = false,
        ["Tweening On HoldTime"] = false,
        ["Silent Mode"] = true,
        ["Hide If Low Health"] = true,
        ["Hiding Health"] = {4000, 8000},
        ["V4"] = true,
        ["LockCamera"] = false,
        ["FPSBoost"] = false,
        ["WhiteScreen"] = false,
        ["BypassTP"] = true,
        ["TweenSpeed"] = 350,
        ["HopRegion"] = "Singapore"
    },
    ["Items"] = {
        ["Melee"] = {
            ["Enable"] = true,
            ["Delay"] = 4,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = .2},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0}
                --   ["V"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        ["Blox Fruit"] = {
            ["Enable"] = false,
            ["Delay"] = 6,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["V"] = {["Enable"] = true, ["HoldTime"] = .25},
                ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        ["Sword"] = {
            ["Enable"] = true,
            ["Delay"] = 4,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = .8},
                ["X"] = {["Enable"] = true, ["HoldTime"] = .2}
            }
        },
        ["Gun"] = {
            ["Enable"] = true,
            ["Delay"] = 3,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        }
    }
}
loadstring(game:HttpGet([[https://raw.githubusercontent.com/eltrul/a/main/Autobounty-0.lua.txt]]))()
