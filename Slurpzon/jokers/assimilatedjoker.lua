SMODS.Joker{
    key = "assimilatedjoker",
    config = {
        extra = {
            used = false,
        }
    },
    loc_txt = {
        ['name'] = 'Assimilated Joker',
        ['text'] = {
            [1] = 'If {C:attention}4/5 {}selected Cards have the',
            [2] = 'same {C:purple}Suit{}, Assimilate the{C:attention} 5th{} card{}',
            [3] = 'Works once each {C:blue}Hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },

    calculate = function(self, card, context)
        if context.evaluate_poker_hand and context.cardarea == G.jokers and not card.ability.extra.used then
            local hand = context.full_hand
            if not hand or #hand ~= 5 then return end

            local suit_counts = {}
            for _, c in ipairs(hand) do
                suit_counts[c.base.suit] = (suit_counts[c.base.suit] or 0) + 1
            end

            local dominant_suit = nil
            for suit, count in pairs(suit_counts) do
                if count == 4 then
                    dominant_suit = suit
                    break
                end
            end

            if not dominant_suit then return end

            for _, c in ipairs(hand) do
                if c.base.suit ~= dominant_suit then
                    SMODS.change_base(c, dominant_suit, nil)
                    card.ability.extra.used = true
                    card:juice_up(0.8, 0.5)
                    -- Re-evaluate the hand now that the suit changed
                    local new_name, _, new_poker_hands, new_scoring_hand = G.FUNCS.get_poker_hand_info(hand)
                    context.scoring_name = new_name
                    context.poker_hands = new_poker_hands
                    context.scoring_hand = new_scoring_hand
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = 'ASSIMILATED!',
                        colour = G.C.PURPLE
                    })
                    break
                end
            end
        end

        if context.after and context.cardarea == G.jokers then
            card.ability.extra.used = false
        end
    end
}