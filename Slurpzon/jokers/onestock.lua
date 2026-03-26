
SMODS.Joker{ --One Stock
    key = "onestock",
    config = {
        extra = {
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'One Stock',
        ['text'] = {
            [1] = '{C:red}+20{} Mult on final hand of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) == to_big(0) then
                return {
                    mult = 20,
                    message = "AS IF!"
                }
            end
        end
    end
}