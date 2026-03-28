SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {17,18,11,15,14,10,4,12,22,20,5,6,1,21,7,19,9,3,13,16,8,2}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {1}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local deckIndexList = {2,1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

load_jokers_folder()
load_consumables_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "slurpzon_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "slurpzon_slurpzon_jokers",
    cards = {
        ["j_slurpzon_adamstare"] = true,
        ["j_slurpzon_archerofjokersvale"] = true,
        ["j_slurpzon_assimilatedjoker"] = true,
        ["j_slurpzon_bestofbalatro"] = true,
        ["j_slurpzon_bubbly"] = true,
        ["j_slurpzon_firewriting"] = true,
        ["j_slurpzon_futurevision"] = true,
        ["j_slurpzon_galssjoker"] = true,
        ["j_slurpzon_goddamnpie"] = true,
        ["j_slurpzon_hangingmorgan"] = true,
        ["j_slurpzon_megacrush"] = true,
        ["j_slurpzon_moeker"] = true,
        ["j_slurpzon_nagrom"] = true,
        ["j_slurpzon_noordinarycat"] = true,
        ["j_slurpzon_onestock"] = true,
        ["j_slurpzon_profitcity"] = true,
		["j_slurpzon_pinthis"] = true,
        ["j_slurpzon_rivalsbet"] = true,
        ["j_slurpzon_thecurse"] = true,
        ["j_slurpzon_upsmash"] = true
    },
})

-- Deck Skin Atlas

SMODS.Atlas({
    key = "Slurpzon_lc",
    path = "slurpzon_lc.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS",
})

SMODS.Atlas({
    key = "Slurpzon_hc",
    path = "slurpzon_hc.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS",
})

-- Deck Skin

SMODS.DeckSkin({
    key = "hearts_skin",
    suit = "Hearts",
    ranks = { "Jack", "Queen", "King" },
    lc_atlas = "Slurpzon_lc",
    hc_atlas = "Slurpzon_hc",
    loc_txt = {
        ['en-us'] = "Slurpzon"
    },
    posStyle = "deck"
})

-- Sleeve

SMODS.Atlas({
    key = "sleeve_sz", 
    path = "sleeve_sz.png", 
    px = 73,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.load_file("sleeves/slurpzite_sleeve.lua")()
SMODS.load_file("sleeves/orange_sleeve.lua")()

if not (SMODS.Mods and SMODS.Mods["bunco"]) then
    table.insert(SMODS.calculation_keys, "bunc_pre_money_change")
    table.insert(SMODS.calculation_keys, "bunc_money_change")
    table.insert(SMODS.calculation_keys, "bunc_new_dollars_mod")
    table.insert(SMODS.other_calculation_keys, "bunc_new_dollars_mod")
    local _original_smods_calculate_individual_effect = SMODS.calculate_individual_effect
    SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
        if key == "bunc_new_dollars_mod" then
            return { [key] = amount }
        end
        return _original_smods_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    end
    local _original_ease_dollars = ease_dollars
    function ease_dollars(mod, instant)
        local ret = SMODS.calculate_context({
            bunc_pre_money_change = true,
            mod = mod,
            sign = (to_big(mod) < to_big(0) and -1 or to_big(mod) > to_big(0) and 1 or 0)
        })
        mod = ret.calculated and to_big(ret.bunc_new_dollars_mod) or mod
        if to_big(mod) == to_big(0) then return end
        _original_ease_dollars(mod, instant)
        if instant then
            SMODS.calculate_context({
                bunc_money_change = true,
                mod = mod,
                sign = (to_big(mod) < to_big(0) and -1 or to_big(mod) > to_big(0) and 1 or 0)
            })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    SMODS.calculate_context({
                        bunc_money_change = true,
                        mod = mod,
                        sign = (to_big(mod) < to_big(0) and -1 or to_big(mod) > to_big(0) and 1 or 0)
                    })
                    return true
                end
            }))
        end
    end
end

SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end