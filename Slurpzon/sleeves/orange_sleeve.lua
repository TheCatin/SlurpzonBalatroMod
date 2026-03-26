if CardSleeves then

    -- Inject localization entries directly, no separate file needed
    G.localization.descriptions.Sleeve = G.localization.descriptions.Sleeve or {}
    G.localization.descriptions.Sleeve['sleeve_slurpzon_orange_sleeve'] = {
        name = 'Orange Sleeve',
        text = {
            'Start run with',
			'{C:attention}52{} Random',
            '{C:diamonds}Diamond {}Cards'
        }
    }
    G.localization.descriptions.Sleeve['sleeve_slurpzon_orange_sleeve_alt'] = {
        name = 'Orange Sleeve',
        text = {
            'Start run with',
            '{C:attention}13{} {C:diamonds}Diamond {}Cards',
			'instead'
        }
    }

    CardSleeves.Sleeve {
        key = 'orange_sleeve',
        pos = { x = 1, y = 0 },
        atlas = 'sleeve_sz',
        config = {},
        unlocked = true,
        loc_vars = function(self)
            if self.get_current_deck_key() == 'b_slurpzon_orange_deck' then
                return { key = self.key .. '_alt' }
            end
            return { key = self.key }
        end,
        apply = function(self, sleeve)
            local using_orange_deck = self.get_current_deck_key() == 'b_slurpzon_orange_deck'

            G.E_MANAGER:add_event(Event({
                func = function()
                    if using_orange_deck then
                        local rank_keys = {}
                        for key, rank in pairs(SMODS.Ranks) do
                            if not rank.gap then
                                rank_keys[#rank_keys + 1] = key
                            end
                        end

                        for i, v in ipairs(G.playing_cards) do
                            local rank_key = rank_keys[i]
                            if rank_key then
                                assert(SMODS.change_base(v, 'Diamonds', rank_key))
                            end
                        end

                        for i = #G.playing_cards, 14, -1 do
                            G.playing_cards[i]:remove()
                            table.remove(G.playing_cards, i)
                        end
                    else
                        for k, v in pairs(G.playing_cards) do
                            assert(SMODS.change_base(v, 'Diamonds'))
                            local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                            assert(SMODS.change_base(v, nil, _rank.key))
                        end
                    end

                    G.GAME.starting_deck_size = #G.playing_cards
                    return true
                end
            }))
        end
    }

end