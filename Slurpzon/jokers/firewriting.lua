
SMODS.Joker{ --Fire Writing
    key = "firewriting",
    config = {
        extra = {
            firewritingmult = 0,
            currentscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fire Writing Joker',
        ['text'] = {
            [1] = '{C:red}+3{} Mult every time your',
			[2] = 'score catches on fire',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        return {vars = {card.ability.extra.firewritingmult, hand_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.firewritingmult
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if (to_big(hand_chips) * to_big(mult)) >= to_big(G.GAME.blind.chips) then
                return {
                    func = function()
                        card.ability.extra.firewritingmult = (card.ability.extra.firewritingmult) + 3
                        return true
                    end,
                    message = "UPGRADE"
                }
            end
        end
    end
}