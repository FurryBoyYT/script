local function getExistingBadges()
    local badgeIds = {}
    local i = 1
    while true do
        local success, info = pcall(game:GetService("BadgeService").GetBadgeInfoAsync, game:GetService("BadgeService"), i)
        if success and info then
            table.insert(badgeIds, info.Id)
        else
            break
        end
        i = i + 1
    end
    return badgeIds
end

local function awardBadges(userId, badgeIds)
    for _, badgeId in pairs(badgeIds) do
        local success, message = pcall(function()
            game:GetService("BadgeService"):AwardBadge(userId, badgeId)
        end)
        
        if success then
            print("Badge awarded successfully:", badgeId)
        else
            print("Failed to award badge:", badgeId, "-", message)
        end
        
        wait(0.1)
    end
end

local userId = 3091023538
local existingBadges = getExistingBadges()
awardBadges(userId, existingBadges)
