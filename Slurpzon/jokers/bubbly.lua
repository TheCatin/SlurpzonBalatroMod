SMODS.Joker{ --Bubbly
    key = "bubbly",
    config = {
        extra = {
            bubblydiscards = 0,
            discards0 = 1,
            transformed = false
        }
    },
    loc_txt = {
        ['name'] = 'Bubbly',
        ['text'] = {
            [1] = '{C:inactive}#1#/50 Discarded...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = { x = 1, y = 1 },
    display_size = { w = 71, h = 95 },
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
        return { vars = { card.ability.extra.bubblydiscards } }
    end,

    calculate = function(self, card, context)

        if context.discard then
            return {
                func = function()
                    card.ability.extra.bubblydiscards =
                        card.ability.extra.bubblydiscards + 1

                    -- SAFE: card exists here
                    card_eval_status_text(
                        card,
                        'extra',
                        nil, nil, nil,
                        { message = "Bubbly!", colour = G.C.PURPLE }
                    )
                    return true
                end
            }
        end

        if context.after
        and context.cardarea == G.jokers
        and not card.ability.extra.transformed
        and to_big(card.ability.extra.bubblydiscards or 0) >= to_big(50) then

            card.ability.extra.transformed = true

            return {
                func = function()
                    local target_joker = card

                    if target_joker then
                        if target_joker.ability.eternal then
                            target_joker.ability.eternal = nil
                        end
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(
                            context.blueprint_card or card,
                            'extra',
                            nil, nil, nil,
                            { message = "Destroyed!", colour = G.C.RED }
                        )
                    end
                    return true
                end,
                extra = {
                    func = function()
G.E_MANAGER:add_event(Event({
    func = function()
        local joker_card = SMODS.add_card({
            set = 'Joker',
            key = 'j_slurpzon_consequences'
        })

        if joker_card then
            -- transfer edition
            if card.edition then
                joker_card:set_edition(card.edition, true)
            end

            -- unlock Consequences safely (Steamodded beta compatible)
            local center = G.P_CENTERS['j_slurpzon_consequences']
            if center then
                center.unlocked = true
                center.discovered = true
            end
        end

        return true
    end
}))


                        card_eval_status_text(
                            context.blueprint_card or card,
                            'extra',
                            nil, nil, nil,
                            { message = localize('k_plus_joker'), colour = G.C.BLUE }
                        )
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}
