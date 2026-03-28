
SMODS.Joker{ --Hanging Morgan
    key = "hangingmorgan",
    config = {
        extra = {
            bossmult = 0,
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hanging Morgan',
        ['text'] = {
            [1] = 'Add {C:red}Mult {}of played {C:attention}poker hand{}',
            [2] = '{C:attention}2{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.bossmult, mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                for i = 1, 2 do
                    SMODS.calculate_effect({mult = card.ability.extra.bossmult}, card)
                end
            end
        end
        if context.before and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.bossmult = mult
                    return true
                end
            }
        end
    end
}