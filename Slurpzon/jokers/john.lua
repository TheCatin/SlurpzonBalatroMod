
SMODS.Joker{ --John The 25th Off Slurpzon
    key = "john",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'John',
        ['text'] = {
            [1] = 'Copies ability of every',
            [2] = 'other {C:attention}Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
calculate = function(self, card, context)
    if not context.joker_main then return end
    for i = 1, #G.jokers.cards do
        local target_joker = G.jokers.cards[i]
        if target_joker ~= card 
            and target_joker.config.center.key ~= 'j_slurpzon_john'
            and target_joker.config.center.key ~= 'j_blueprint'
			and target_joker.config.center.key ~= 'j_brainstorm'
            and target_joker.config.center.blueprint_compat ~= false then
            local ret = SMODS.blueprint_effect(card, target_joker, context)
            if ret then
                SMODS.calculate_effect(ret, card)
            end
        end
    end
end
}