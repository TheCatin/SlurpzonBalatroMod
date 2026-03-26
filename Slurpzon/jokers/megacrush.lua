SMODS.Joker { -- Mega Crush
    key = "megacrush",
    config = {
        extra = {
            megacrushuses = 10,
            -- Stores a direct reference to the chosen joker for this hand.
            -- Picked fresh in context.before, cleared in context.after.
            target = nil
        }
    },
    loc_txt = {
        name = 'Mega Crush',
        text = {
            [1] = 'Retrigger a random {C:attention}Joker{}',
            [2] = 'for the next {C:blue}#1#{} Hands'
        }
    },
    pos = { x = 9, y = 1 },
    display_size = { w = 71, h = 95 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.megacrushuses } }
    end,
    calculate = function(self, card, context)
        -- STEP 1: Before scoring begins, pick a random target (once per hand).
        -- context.before fires once before any joker scoring, cardarea = G.jokers.
        if context.before and context.cardarea == G.jokers then
            card.ability.extra.target = nil
            if card.ability.extra.megacrushuses > 0 then
                local valid = {}
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= card then table.insert(valid, j) end
                end
                if #valid > 0 then
                    card.ability.extra.target = valid[math.random(#valid)]
                end
            end
            return  -- don't fall through to blueprint copy during before stage
        end

        -- STEP 2: After the hand resolves, spend a use and handle EMPTY.
        -- Guard not context.end_of_round so we only fire on played hands.
        if context.after and context.cardarea == G.jokers and not context.end_of_round then
            card.ability.extra.target = nil
            if card.ability.extra.megacrushuses <= 0 then return end

            card.ability.extra.megacrushuses = card.ability.extra.megacrushuses - 1

            if card.ability.extra.megacrushuses <= 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil,
                    { message = 'EMPTY!', colour = G.C.RED })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            else
                card_eval_status_text(card, 'extra', nil, nil, nil,
                    { message = card.ability.extra.megacrushuses .. ' left', colour = G.C.BLUE })
            end
            return  -- don't fall through to blueprint copy during after stage
        end

        -- STEP 3: On every other context pass, copy the target using the exact
        -- same pattern as Brainstorm from the SMODS docs. SMODS.blueprint_effect
        -- internally decides which contexts are valid to copy — no filtering needed.
        local target = card.ability.extra.target
        if target and target ~= card and card.ability.extra.megacrushuses > 0 then
            local ret = SMODS.blueprint_effect(card, target, context)
            if ret then return ret end
        end
    end
}