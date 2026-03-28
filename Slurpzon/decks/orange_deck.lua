SMODS.Back {
    key = 'orange_deck',
    pos = { x = 1, y = 0 },
    config = {},
    loc_txt = {
        name = 'Orange Deck',
        text = {
            [1] = 'Start run with',
			[2] = '{C:attention}52{} Random',
            [3] = '{C:diamonds}Diamond {}Cards'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        -- If the orange sleeve is equipped, let it handle everything
        local orange_sleeve_key = 'sleeve_slurpzon_orange_sleeve'
        if G.GAME.selected_sleeve == orange_sleeve_key then return end

        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    assert(SMODS.change_base(v, 'Diamonds'))
                    local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                    assert(SMODS.change_base(v, nil, _rank.key))
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}