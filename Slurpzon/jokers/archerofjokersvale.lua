SMODS.Joker{
    key = "archerofjokersvale",
    config = {
        extra = {
            boosted = true
        }
    },
    loc_txt = {
        ['name'] = 'Archer Of Jokersvale',
        ['text'] = {
            [1] = 'Every {C:green}Chance {}outside of a {C:attention}Blind{}',
            [2] = 'is guaranteed, First {C:green}Chance {}',
            [3] = 'in a {C:attention}Blind {}is also guaranteed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = { x = 2, y = 2 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },

calculate = function(self, card, context)
    -- Outside of a blind, always guaranteed
    -- Inside a blind, only guaranteed if still boosted
    if context.fix_probability then
        local in_blind = G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.SELECTING_HAND
        if not in_blind or card.ability.extra.boosted then
            return {
                numerator = context.denominator,
                denominator = context.denominator
            }
        end
    end

    -- Detect successful chance trigger during blind and revert
    if context.pseudorandom_result and context.result and card.ability.extra.boosted then
	            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = 'I Dont Miss!',
                colour = G.C.PURPLE
				})
        local in_blind = G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.SELECTING_HAND
        if in_blind then
            card.ability.extra.boosted = false
            card:juice_up(0.8, 0.5)
        end
    end

    -- Restore boost at the end of the round
if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.boosted = true
                    return true
                end
            }
        end
end
}