
SMODS.Joker{ --No Ordinary Cat
    key = "noordinarycat",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'No Ordinary Cat',
        ['text'] = {
            [1] = '{C:green} #1# in #2# {} chance to',
            [2] = 'create a {C:purple}Blessing of Juan{}',
            [3] = 'after each round',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_slurpzon_blessingofjuan"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_slurpzon_blessingofjuan\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_slurpzon_noordinarycat') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_46ca381e', 1, card.ability.extra.odds, 'j_slurpzon_noordinarycat', false) then
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', key = 'c_slurpzon_blessingofjuan'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}