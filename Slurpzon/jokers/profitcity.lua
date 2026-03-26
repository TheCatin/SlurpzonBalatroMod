local profitcity_blueprint_firing = false
local profitcity_fired_this_call = false
SMODS.Joker{ --Profit City
    key = "profitcity",
    config = {
        extra = {
            bonus = 1
        }
    },
    loc_txt = {
        ['name'] = 'Profit City',
        ['text'] = {
            [1] = 'Every source of income',
            [2] = 'grants an extra {C:money}$1{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = { x = 6, y = 1 },
    display_size = { w = 71, h = 95 },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },

    calculate = function(self, card, context)
        if context.bunc_pre_money_change and context.sign == 1 then
            print("firing - blueprint:", tostring(context.blueprint), "flag:", tostring(profitcity_blueprint_firing), "fired:", tostring(profitcity_fired_this_call))
            if profitcity_blueprint_firing then return end

            if context.blueprint then
                if profitcity_fired_this_call then return end
                profitcity_blueprint_firing = true
                ease_dollars(1)
                profitcity_blueprint_firing = false
                return {
                    message = "+$1",
                    colour = G.C.MONEY,
                }
            end

            if profitcity_fired_this_call then return end
            profitcity_fired_this_call = true
            local new_mod = to_big(context.mod) + to_big(1)
            return {
                bunc_new_dollars_mod = new_mod,
                message = "+$1",
                colour = G.C.MONEY,
            }
        end

        if context.bunc_money_change then
            profitcity_fired_this_call = false
        end
    end
}
