SMODS.Joker{ --Future Vision
    key = "futurevision",
    config = {
        extra = {
        }
    },
loc_txt = {
    ['name'] = 'Future Vision',
    ['text'] = {
        [1] = 'Next {C:attention}5{} cards to be drawn:',
        [2] = '{V:1}#1#{}',
        [3] = '{V:2}#2#{}',
        [4] = '{V:3}#3#{}',
        [5] = '{V:4}#4#{}',
        [6] = '{V:5}#5#{}'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},

    pos = {
        x = 1,
        y = 2
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
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["slurpzon_slurpzon_jokers"] = true },

loc_vars = function(self, info_queue, card)
    local in_play = false
    if G.jokers then
        for _, j in ipairs(G.jokers.cards) do
            if j == card then
                in_play = true
                break
            end
        end
    end

    local suit_display = {
        ['Spades'] = 'Spades',
        ['Hearts'] = 'Hearts',
        ['Clubs'] = 'Clubs',
        ['Diamonds'] = 'Diamonds',
        ['bunc_Fleurons'] = 'Fleurons',
        ['bunc_Halberds'] = 'Halberds',
    }

    local labels = {}
    local colours = {}
    for i = 1, 5 do
        if in_play and G.deck and G.deck.cards and G.deck.cards[#G.deck.cards - i + 1] then
            local c = G.deck.cards[#G.deck.cards - i + 1]
            if c.ability and c.ability.effect == 'Stone Card' then
                labels[i] = 'Stone Card'
                colours[i] = G.C.UI.TEXT_INACTIVE
            else
                local suit_name = suit_display[c.base.suit] or c.base.suit
                labels[i] = c.base.value .. ' of ' .. suit_name
                colours[i] = G.C.SUITS[c.base.suit] or G.C.UI.TEXT_INACTIVE
            end
        else
            labels[i] = '???'
            colours[i] = G.C.UI.TEXT_INACTIVE
        end
    end

    return {
        vars = {
            labels[1], labels[2], labels[3], labels[4], labels[5],
            colours = { colours[1], colours[2], colours[3], colours[4], colours[5] }
        }
    }
end
}