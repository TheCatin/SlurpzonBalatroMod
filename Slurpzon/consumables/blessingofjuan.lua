-- Modular Blessing of Juan Tarot Card
-- Bunco support, synced edition-get animation, no extra sounds
-- Card Sleeves support: adds j_slurpzon_john when using slurpzite deck + sleeve

local function get_blessing_effect()
    local pool = { 'e_foil', 'e_holo', 'e_polychrome', 'e_negative' }
    -- Check G.P_CENTERS directly instead of mod detection.
    -- Safe regardless of load order: if the edition key isn't registered
    -- (because Bunco isn't loaded), it simply won't be added to the pool.
    if G.P_CENTERS and G.P_CENTERS['e_bunc_glitter'] then
        table.insert(pool, 'e_bunc_glitter')
    end
    if G.P_CENTERS and G.P_CENTERS['e_bunc_fluorescent'] then
        table.insert(pool, 'e_bunc_fluorescent')
    end
    return pool[math.random(#pool)]
end

-- Returns true if the slurpzite sleeve + deck combo is active with Card Sleeves loaded.
local function should_include_john()
    if not CardSleeves then return false end

    -- CardSleeves API: G.GAME.selected_sleeve holds the key of the active sleeve.
    if G.GAME.selected_sleeve ~= 'sleeve_slurpzon_slurpzite_sleeve' then return false end

    -- CardSleeves API: get_current_deck_key() works both in select screen and during a run.
    if CardSleeves.Sleeve.get_current_deck_key() ~= 'b_slurpzon_slurpzite_deck' then return false end

    return true
end

-- Builds a local copy of the slurpzon joker pool keys.
-- The pool is registered as SMODS.ObjectType, so its cards field is a
-- dictionary { [key] = true } rather than an array — iterate with pairs().
local function build_juan_joker_pool()
    local pool = {}

    local hour = tonumber(os.date("%H")) -- 0–23
    local is_moeker_hour = hour >= 22 or hour <= 6

    local obj_type = SMODS.ObjectTypes and SMODS.ObjectTypes['slurpzon_slurpzon_jokers']
    if obj_type and obj_type.cards then
        for key, _ in pairs(obj_type.cards) do
            -- Moeker is time-locked: only include it between 10 PM and 6 AM,
            -- matching the same condition used in moeker's own in_pool check.
            if key ~= 'j_slurpzon_moeker' or is_moeker_hour then
                table.insert(pool, key)
            end
        end
    end

    -- John injection: appended exactly once if conditions are met.
    if should_include_john() then
        table.insert(pool, 'j_slurpzon_john')
    end

    return pool
end

-- Picks a random joker from our local pool and spawns it.
-- Falls back to the original SMODS add_card only if pool building completely fails.
local function spawn_juan_joker()
    local pool = build_juan_joker_pool()
    if #pool > 0 then
        local chosen_key = pool[math.random(#pool)]
        -- 7th arg to create_card is forced_key — spawns this exact joker.
        local new_card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_key)
        new_card:add_to_deck()
        G.jokers:emplace(new_card)
    else
        -- Fallback: ObjectType not found (e.g. load order issue).
        -- Will NOT include John but at least won't crash.
        SMODS.add_card({ set = 'slurpzon_slurpzon_jokers' })
    end
end

SMODS.Consumable {
    key = 'blessingofjuan',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_txt = {
        name = 'Blessing of Juan',
        text = {
            [1] = 'Create a random {C:purple}Slurpzon{} {C:attention}Joker{}',
            [2] = 'If {C:attention}Joker{} slots are full, enhance{}',
            [3] = 'an unenhanced {C:purple}Slurpzon{} {C:attention}Joker{}'
        }
    },
    can_use = function()
        local limit = G.jokers and G.jokers.config.card_limit or 0
        if #G.jokers.cards < limit then return true end
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key and not j.edition then
                if string.find(j.config.center.key, 'slurpzon') then return true end
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        local joker_limit = G.jokers.config.card_limit
        local joker_count = #G.jokers.cards

        -- CASE 1: CREATE NEW JOKER
        if joker_count < joker_limit then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < joker_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        spawn_juan_joker()
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            return
        end

        -- CASE 2: ENHANCE EXISTING SLURPZON JOKER
        local valid_targets = {}
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key and not j.edition then
                if string.find(j.config.center.key, 'slurpzon') then
                    table.insert(valid_targets, j)
                end
            end
        end
        if #valid_targets == 0 then return end

        local target = valid_targets[math.random(#valid_targets)]
        local effect = get_blessing_effect()

        -- Dramatic lead-in
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- Apply edition synced with shake, no extra sounds
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if target and not target.edition then
                    target:set_edition(effect, true)
                    target:juice_up(0.25, 0.3)
                end
                return true
            end
        }))

        delay(0.5)
        G.jokers:unhighlight_all()
    end
}