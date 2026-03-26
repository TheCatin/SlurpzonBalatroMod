
SMODS.Joker{ --Nagrom
    key = "nagrom",
    config = {
        extra = {
            firsthand = 0,
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Nagrom',
        ['text'] = {
            [1] = '{C:red}+20{} Mult on first hand of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.firsthand}}
    end,
    
    calculate = function(self, card, context)
        if context.first_hand_drawn  then
            return {
                func = function()
                    card.ability.extra.firsthand = 1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.firsthand or 0)) == to_big(1) then
                return {
                    mult = 20,
                    message = "!Fi SA"
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.firsthand = 0
                    return true
                end
            }
        end
    end
}