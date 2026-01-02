local haunted_mirror = SMODS.Joker {
    key = "haunted_mirror",
    atlas = "jokers",
    pos = {
        x = 6,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

haunted_mirror.loc_vars = function(self, info_queue, card)
    if G.j_o_y_last_sold_joker then
        table.insert(info_queue, G.j_o_y_last_sold_joker.config.center)
    end
    local label = G.j_o_y_last_sold_joker and localize({ type = "name_text", set = G.j_o_y_last_sold_joker.config.center.set, key = G.j_o_y_last_sold_joker.config.center.key }) or localize "k_none"

    return {
        vars = { label }
    }
end

haunted_mirror.calculate = function(self, card, context)
    local can_copy = function (c)
        return c.label ~= card.label and c.config.center.blueprint_compat
    end

    if context.check_eternal and not context.blueprint then
        local can_shake = false

        if G.jokers.highlighted then
           	local selected_card = G.jokers.highlighted[1]
            can_shake = selected_card and can_copy(selected_card)
        end

        if can_shake then card:juice_up(0.25, 0.25) end
    end

    if context.selling_card and can_copy(context.card) then
        -- TODO learn how to change save data to include the last sold joker
        G.j_o_y_last_sold_joker = context.card
    end

    if G.j_o_y_last_sold_joker then
        local joker = context.blueprint and context.blueprint_copiers_stack[1] or card
        local ret = SMODS.blueprint_effect(joker, G.j_o_y_last_sold_joker, context)

        if ret then
            -- ! this approach does not work with retrigger-based jokers
            -- TODO find a way to allow retriggers for both procs
            SMODS.calculate_effect(ret, joker, true)
            SMODS.calculate_effect(ret, joker, true)
        end
    end
end
