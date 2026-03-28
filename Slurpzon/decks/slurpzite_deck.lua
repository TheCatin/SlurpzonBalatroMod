SMODS.Back {
    key = 'slurpzite_deck',
    pos = { x = 0, y = 0 },
    config = {},
    loc_txt = {
        name = 'Slurpzite Deck',
        text = {
            [1] = 'Start run with {C:attention}2{}',
			[2] = '{C:purple}Blessings Of Juan{}',
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        if G.GAME.selected_sleeve == 'sleeve_slurpzon_slurpzite_sleeve' then return end
        give_juan_blessing()
        give_juan_blessing()
    end,
}