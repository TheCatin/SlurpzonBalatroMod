
SMODS.Joker{ --Rivals Bet
    key = "rivalsbet",
    config = {
        extra = {
            odds = 4,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Rivals Bet',
        ['text'] = {
            [1] = '{C:green}#1# in #2# Chance{} to win {C:money}$5{} every {C:blue}Hand {}played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_slurpzon_rivalsbet') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_bc888a59', 1, card.ability.extra.odds, 'j_slurpzon_rivalsbet', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 5
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "YOU WON!", colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }