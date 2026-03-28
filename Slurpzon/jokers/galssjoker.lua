
SMODS.Joker{ --Galss Joker
    key = "galssjoker",
    config = {
        extra = {
            galssmult = 1,
            levels0 = -1
        }
    },
    loc_txt = {
        ['name'] = 'Galss Joker',
        ['text'] = {
            [1] = 'This Joker will {C:red}Level Down{} the',
            [2] = 'Played {C:planet}Poker Hand{}, giving {X:mult,C:white}X0.25{} Mult',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white} X#1# {} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
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
        
        return {vars = {card.ability.extra.galssmult}}
    end,
    
calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers then
        if (function()
            for hand, data in pairs(G.GAME.hands) do
                if hand == context.scoring_name and to_big(data.level) >= to_big(2) then
                    return true
                end
            end
            return false
        end)() then
            local target_hand = (context.scoring_name or "High Card")
            level_up_hand(card, target_hand, nil, -1)
            return {
                message = localize('k_level_up_ex'),
                extra = {
                    func = function()
                        card.ability.extra.galssmult = card.ability.extra.galssmult + 0.25
                        return true
                    end,
                    message = "+0.25X",
                    colour = G.C.GREEN
                }
            }
        end
    end
    if context.cardarea == G.jokers and context.joker_main then
        return {
            Xmult = card.ability.extra.galssmult
        }
    end
end
}