
SMODS.Joker{ --Adam Stare
    key = "adamstare",
    config = {
        extra = {
            adamstaretriggers = 0,
            xmult0 = 0.5,
            joker_slots0 = 1,
            scale0 = 0.5,
            rotation0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Adam Stare',
        ['text'] = {
            [1] = '{X:mult,C:white}X0.5 {} Mult, Only triggers as the last Joker',
            [2] = 'Sell this card for {C:attention}+1{} {C:legendary}Joker Slot{} after',
            [3] = 'triggering 10 times',
            [4] = '{C:inactive}#1#/10 Triggers{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.adamstaretriggers}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                return G.jokers.cards[#G.jokers.cards] == card
            end)() then
                card.ability.extra.adamstaretriggers = (card.ability.extra.adamstaretriggers) + 1
                return {
                    Xmult = 0.5
                }
            end
        end
        if context.selling_self  then
            if to_big((card.ability.extra.adamstaretriggers or 0)) >= to_big(10) then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Joker Slot", colour = G.C.DARK_EDITION})
                        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                        return true
                    end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.adamstaretriggers or 0)) >= to_big(10) then
                local target_card = context.other_card
                local function juice_card_until_(card, eval_func, first, delay) -- balatro function doesn't allow for custom scale and rotation
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',delay = delay or 0.1, blocking = false, blockable = false, timer = 'REAL',
                    func = (function() if eval_func(card) then if not first or first then card:juice_up(0.5, 0.5) end;juice_card_until_(card, eval_func, nil, 0.8) end return true end)
                    }))
                end
                return {
                    func = function()
                    local eval = function() return not G.RESET_JIGGLES end
                        juice_card_until_(card, eval, true)
                        return true
                    end
                }
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_slurpzon_adamstare" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_slurpzon_adamstare" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end