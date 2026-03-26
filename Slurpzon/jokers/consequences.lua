
SMODS.Joker{ --Consequences
    key = "consequences",
    config = {
        extra = {
            discards_change = '3'
        }
    },
    loc_txt = {
        ['name'] = 'Consequences',
        ['text'] = {
            [1] = '{C:red}+3{} Discards'
        },
        ['unlock'] = {
            [1] = 'Fill the Bubbly Crucible'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = false },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
            or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 3
    end
}