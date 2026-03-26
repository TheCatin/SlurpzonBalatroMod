SMODS.Joker{ -- Moeker
    key = "moeker",
    config = {
        extra = {
            xmult0 = 2
        }
    },
    loc_txt = {
        name = "Moeker",
        text = {
            "{X:red,C:white}X2{} Mult between 10 PM and 6 AM"
        }
    },
    pos = { x = 4, y = 0 },
    display_size = { w = 71, h = 95 },
    cost = 6,
    rarity = 1,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,
    atlas = "CustomJokers",

    pools = { ["slurpzon_slurpzon_jokers"] = true },

    -- SHOP ONLY
in_pool = function(self, args)
    if not args or args.source ~= "sho" then
        return false
    end

    local hour = tonumber(os.date("%H")) -- 0–23

    -- 10 PM → 6 AM inclusive
    return hour >= 22 or hour <= 6
end,


    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local hour = tonumber(os.date("%H")) -- 0–23

            -- Active from 22:00 → 06:59
            if hour >= 22 or hour <= 6 then
                return {
                    Xmult = card.ability.extra.xmult0,
                    message = "Red Arrow?"
                }
            end
        end
    end
}
