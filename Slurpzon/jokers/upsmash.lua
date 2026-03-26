
SMODS.Joker{ --Up Smash
    key = "upsmash",
    config = {
        extra = {
            upsmashmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Up Smash',
        ['text'] = {
            [1] = 'Gain {X:red,C:white}0.5X{} Mult per {C:blue}Hand{} played',
            [2] = 'Resets after round',
            [3] = 'Currently {X:mult,C:white} X#1# {} Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.upsmashmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.upsmashmult
            }
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.upsmashmult = (card.ability.extra.upsmashmult) + 0.5
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.upsmashmult = 1
                    return true
                end,
                extra = {
                    message = "Reset",
                    colour = G.C.ORANGE
                }
            }
        end
    end
}