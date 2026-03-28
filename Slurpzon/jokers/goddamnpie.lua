
SMODS.Joker{ --Goddamn Pie
    key = "goddamnpie",
    config = {
        extra = {
            xmult0 = 4,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Goddamn Pie',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult, {C:green}#1# in #2# chance{} for {C:red}Game Over{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_slurpzon_goddamnpie') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = 4
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_52ce0a37', 1, card.ability.extra.odds, 'j_slurpzon_goddamnpie', false) then
                            SMODS.calculate_effect({func = function()
                                
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.5,
                                    func = function()
                                        if G.STAGE == G.STAGES.RUN then 
                                            G.STATE = G.STATES.GAME_OVER
                                            G.STATE_COMPLETE = false
                                        end
                                    end
                                }))
                                
                                return true
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}