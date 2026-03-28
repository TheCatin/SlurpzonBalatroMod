SMODS.Atlas({
    key = "bestofslurp",
    path = "bestofslurp.png",
    px = 95,
    py = 71,
    atlas_table = "ASSET_ATLAS",
})
SMODS.Joker{ --Best Of Balatro
    key = "bestofbalatro",
    config = {
        extra = {
            odds = 4,
            mult0 = 15,
            chips0 = 150,
            xmult0 = 1.5,
            xchips0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Best Of Balatro',
        ['text'] = {
            [1] = '{C:green}#1# in #2# Chance{} for {C:red}+15{} Mult',
            [2] = '{C:green}#1# in #2# Chance{} for {C:blue}+150{} Chips',
            [3] = '{C:green}#1# in #2# Chance{} for {X:red,C:white}X1.5{} Mult',
            [4] = '{C:green}#1# in #2# Chance{} for {X:blue,C:white}X1.5{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 95, 
        h = 71
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'bestofslurp',
    pools = { ["slurpzon_slurpzon_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_slurpzon_bestofbalatro')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_slurpzon_bestofbalatro')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_slurpzon_bestofbalatro')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_slurpzon_bestofbalatro')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2d33abd3', 1, card.ability.extra.odds, 'j_slurpzon_bestofbalatro', false) then
                    SMODS.calculate_effect({mult = 15}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_07390735', 1, card.ability.extra.odds, 'j_slurpzon_bestofbalatro', false) then
                    SMODS.calculate_effect({chips = 150}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_2df250cc', 1, card.ability.extra.odds, 'j_slurpzon_bestofbalatro', false) then
                    SMODS.calculate_effect({Xmult = 1.5}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_07ea7aab', 1, card.ability.extra.odds, 'j_slurpzon_bestofbalatro', false) then
                    SMODS.calculate_effect({x_chips = 1.5}, card)
                end
            end
        end
    end
}