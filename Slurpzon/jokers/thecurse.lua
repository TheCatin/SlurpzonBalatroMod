
SMODS.Joker{ --The Curse
    key = "thecurse",
    config = {
        extra = {
            hands_change = '1',
            sins = 0,
            currentchiptotal = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Curse',
        ['text'] = {
            [1] = '{C:red}-1{} Hand, Excess {C:attention}Score {}this {C:attention}Ante {}is subracted',
            [2] = 'from the {C:attention}Boss Blind{}',
            [3] = '{C:blue}#1#{} {C:inactive}sins of the father are to be laid upon the children.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.sins, (G.GAME.chips or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (G.GAME.blind:get_type() == 'Small' or G.GAME.blind:get_type() == 'Big') then
                return {
                    func = function()
                        card.ability.extra.sins = (card.ability.extra.sins) + (G.GAME.chips - G.GAME.blind.chips)
                        return true
                    end
                }
            end
        end
        if context.first_hand_drawn  then
            if G.GAME.blind.boss then
                local sins_value = card.ability.extra.sins
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Laid Upon The Children", colour = G.C.RED})
                            G.GAME.blind.chips = G.GAME.blind.chips - sins_value
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.sins = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - 1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
    end
}