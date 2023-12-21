local CFrame_Mobs = {
    ["Bandit"] = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125),
    ["Monkey"] = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209),
    ["Gorilla"] = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875),
    ["Pirate"] = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125),
    ["Brute"] = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875),
    ["Desert Bandit"] = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375),
    ["Desert Officer"] = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875),
    ["Snow Bandit"] = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125),
    ["Snowman"] = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625),
    ["Chief Petty Officer"] = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625),
    ["Sky Bandit"] = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625),
    ["Dark Master"] = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625),
    ["Prisoner"] = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781),
    ["Dangerous Prisoner"] = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375),
    ["Toga Warrior"] = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625),
    ["Gladiator"] = {CFrame.new(-1483, 36, -3188), CFrame.new(-1282, 36, -3059), CFrame.new(-1380, 36, -3405), CFrame.new(-1104, 36, -3260)},
    ["Military Soldier"] = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875),
    ["Military Spy"] = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375),
    ["Fishman Warrior"] = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625),
    ["Fishman Commando"] = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875),
    ["God's Guard"] = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375),
    ["Shanda"] = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531),
    ["Royal Squad"] = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875),
    ["Royal Soldier"] = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625),
    ["Galley Pirate"] = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875),
    ["Galley Captain"] = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375),
    ["Raider"] = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125),
    ["Mercenary"] = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625),
    ["Swan Pirate"] = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625),
    ["Factory Staff"] = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875),
    ["Marine Lieutenant"] = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125),
    ["Marine Captain"] = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625),
    ["Zombie"] = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875),
    ["Vampire"] = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625),
    ["Snow Trooper"] = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875),
    ["Winter Warrior"] = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625),
    ["Lab Subordinate"] = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375),
    ["Horned Warrior"] = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375),
    ["Magma Ninja"] = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375),
    ["Lava Pirate"] = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875),
    ["Ship Deckhand"] = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375),
    ["Ship Engineer"] = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875),
    ["Ship Steward"] = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625),
    ["Ship Officer"] = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625),
    ["Arctic Warrior"] = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125),
    ["Snow Lurker"] = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375),
    ["Sea Soldier"] = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125),
    ["Water Fighter"] = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875),
    ["Pirate Millionaire"] = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375),
    ["Pistol Billionaire"] = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875),
    ["Dragon Crew Warrior"] = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625),
    ["Dragon Crew Archer"] = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125),
    ["Female Islander"] = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312),
    ["Giant Islander"] = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508),
    ["Marine Commodore"] = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125),
    ["Marine Rear Admiral"] = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125),
    ["Fishman Raider"] = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625),
    ["Fishman Captain"] = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625),
    ["Forest Pirate"] = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625),
    ["Mythological Pirate"] = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125),
    ["Jungle Pirate"] = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625),
    ["Musketeer Pirate"] = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375),
    ["Reborn Skeleton"] = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625),
    ["Living Zombie"] = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875),
    ["Demonic Soul"] = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625),
    ["Posessed Mummy"] = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625),
    ["Peanut Scout"] = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875),
    ["Peanut President"] = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875),
    ["Ice Cream Chef"] = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125),
    ["Ice Cream Commander"] = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625),
    ["Cookie Crafter"] = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375),
    ["Cake Guard"] = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875),
    ["Baking Staff"] = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375),
    ["Head Baker"] = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125),
    ["Cocoa Warrior"] = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125),
    ["Chocolate Bar Battler"] = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375),
    ["Sweet Thief"] = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625),
    ["Candy Rebel"] = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625),
    ["Candy Pirate"] = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875),
    ["Isle Outlaw"] = CFrame.new(-16479.900390625, 226.6117401123047, -300.3114318847656),
    ["Island Boy"] = CFrame.new(-16849.396484375, 192.86505126953125, -150.7853240966797),
    ["Sun-kissed Warrior"] = CFrame.new(-16347, 64, 984),
    ["Isle Champion"] = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875)
}

local NameMob = "Gladiator"
print(CFrame_Mobs[NameMob[math.random(1, #CFrame_Mobs[NameMob])]])
