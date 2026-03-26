function give_juan_blessing()
    local card_count = G.consumeables and G.consumeables.cards and #G.consumeables.cards or 0
    local card_limit = (G.consumeables and G.consumeables.config and G.consumeables.config.card_limit) or 100
    if card_count >= card_limit then return end
    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('timpani')
            SMODS.add_card({
                set = 'Tarot',
                key = 'c_slurpzon_blessingofjuan',
                allow_duplicates = true
            })
            return true
        end
    }))
end

if CardSleeves then
    G.localization.descriptions.Sleeve = G.localization.descriptions.Sleeve or {}
    G.localization.descriptions.Sleeve['sleeve_slurpzon_slurpzite_sleeve'] = {
        name = 'Slurpzite Sleeve',
        text = {
            'Start run with {C:attention}2{}',
			'{C:purple}Blessings Of Juan{}',
        }
    }
    G.localization.descriptions.Sleeve['sleeve_slurpzon_slurpzite_sleeve_alt'] = {
        name = 'Slurpzite Sleeve',
        text = {
            'Receive a {C:purple}Blessing of Juan{}',
            'after defeating a {C:attention}Boss Blind{}',
			'{X:legendary,C:white}John{} may be blessed'
        }
    }

    CardSleeves.Sleeve {
        key = 'slurpzite_sleeve',
        pos = { x = 0, y = 0 },
        atlas = 'sleeve_sz',
        config = {},
        unlocked = true,
        loc_vars = function(self)
            if self.get_current_deck_key() == 'b_slurpzon_slurpzite_deck' then
                return { key = self.key .. '_alt' }
            end
            return { key = self.key }
        end,
        apply = function(self, sleeve)
            give_juan_blessing()
            give_juan_blessing()
        end,
        calculate = function(self, sleeve, context)
            if context.end_of_round and context.main_eval and G.GAME.blind.boss then
                local using_slurpzite_deck = self.get_current_deck_key() == 'b_slurpzon_slurpzite_deck'
                if using_slurpzite_deck then
                    give_juan_blessing()
                end
            end
        end
    }
end