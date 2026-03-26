
SMODS.Joker{ --Pin This!
    key = "pinthis",
    config = {
        extra = {
            pins = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pin This!',
        ['text'] = {
            [1] = 'Gain a {C:attention}Pin {}after each {C:blue}Hand {}played',
            [2] = 'After {C:attention}5{} {C:attention}Pins{}, create a random {C:attention}Tag{}',
            [3] = '{C:inactive}#1# Pins{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.pins}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.pins or 0)) >= to_big(5) then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
                                if tag.name == "Orbital Tag" then
                                    local _poker_hands = {}
                                    for k, v in pairs(G.GAME.hands) do
                                        if v.visible then
                                            _poker_hands[#_poker_hands + 1] = k
                                        end
                                    end
                                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                                end
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "PINNED!",
                    extra = {
                        func = function()
                            card.ability.extra.pins = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            else
                return {
                    func = function()
                        card.ability.extra.pins = (card.ability.extra.pins) + 1
                        return true
                    end
                }
            end
        end
    end
}